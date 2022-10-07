import Foundation
import Flutter
import UIKit
import kevin_ios
import kevin_flutter_core_ios

public class SwiftKevinFlutterInAppPaymentsPlugin: NSObject, FlutterPlugin, KevinPaymentSessionDelegate {
    private var paymentResult: FlutterResult? = nil
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "kevin_flutter_payments_ios", binaryMessenger: registrar.messenger())
        let instance = SwiftKevinFlutterInAppPaymentsPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch KevinPaymentsMethod(rawValue: call.method) {
        case .setPaymentsConfiguration:
            onSetPaymentsConfiguration(call: call, result: result)
        case .startPayment:
            onStartPayment(call: call, result: result)
        case .getCallbackUrl:
            onGetCallbackUrl(result: result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    public func onKevinPaymentInitiationStarted(controller: UINavigationController) {
        UIApplication.shared.delegate!.window!!.rootViewController!
            .present(controller, animated: true, completion: nil)
    }
    
    public func onKevinPaymentCanceled(error: Error?) {
        let parsedError = KevinFlutterErrorParser.parseFlutterError(error: error)
        self.paymentResult?(parsedError)
        self.paymentResult = nil
    }
    
    public func onKevinPaymentSucceeded(paymentId: String, status: KevinPaymentStatus) {
        let result = KevinPaymentsSuccess(paymentId: paymentId)
        
        do {
            let jsonString = try JsonParser.parseToJsonString(data: result)
            self.paymentResult?(jsonString)
            self.paymentResult = nil
        } catch {
            let parsedError = KevinFlutterErrorParser.parseFlutterUnexpectedError(error: error)
            self.paymentResult?(parsedError)
            self.paymentResult = nil
        }
    }
    
    private func onSetPaymentsConfiguration(call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let data = call.arguments as? [String: Any?] else {
            result(KevinFlutterErrorParser.parseFlutterUnexpectedError(message: "Payments configuration can not be null"))
            return
        }
        
        do {
            let configuration = try getPaymentsConfiguration(data: data)
            
            KevinInAppPaymentsPlugin.shared.configure(configuration)
            result(nil)
        } catch {
            let parsedError = KevinFlutterErrorParser.parseFlutterUnexpectedError(error: error)
            result(parsedError)
        }
    }
    
    private func onStartPayment(call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let data = call.arguments as? [String: Any?] else {
            result(KevinFlutterErrorParser.parseFlutterUnexpectedError(message: "Payment session configuration can not be null"))
            return
        }
        
        do {
            let paymentConfiguration = try getPaymentSessionConfiguration(data: data)
            
            paymentResult = result
            
            KevinPaymentSession.shared.delegate = self
            KevinPaymentSession.shared.initiatePayment(configuration: paymentConfiguration)
        } catch {
            let parsedError = KevinFlutterErrorParser.parseFlutterUnexpectedError(error: error)
            result(parsedError)
        }
    }
    
    private func onGetCallbackUrl(result: @escaping FlutterResult) {
        do {
            let callbackUrl = try KevinInAppPaymentsPlugin.shared.getCallbackUrl()
            result(callbackUrl.absoluteString)
        } catch {
            let parsedError = KevinFlutterErrorParser.parseFlutterUnexpectedError(error: error)
            result(parsedError)
        }
    }
    
    private func getPaymentsConfiguration(data: [String: Any?]) throws -> KevinInAppPaymentsConfiguration {
        let configurationData : PaymentsConfigurationEntity = try JsonParser.parseToObject(data: data)

        return KevinInAppPaymentsConfiguration
            .Builder(callbackUrl: URL(string: configurationData.callbackUrl)!)
            .build()
    }
    
    private func getPaymentSessionConfiguration(data: [String: Any?]) throws -> KevinPaymentSessionConfiguration {
        let configurationData : PaymentSessionConfigurationEntity = try JsonParser.parseToObject(data: data)

        var preselectedCountry: KevinCountry?
        if let configurationPreselectedCountry = configurationData.preselectedCountry {
            preselectedCountry = KevinCountry(rawValue: configurationPreselectedCountry)
        }

        let countryFilter = configurationData.countryFilter.map {
            KevinCountry(rawValue: $0)
        }

        let configurationBuilder = KevinPaymentSessionConfiguration
            .Builder(paymentId: configurationData.paymentId)
            .setPreselectedCountry(preselectedCountry)
            .setDisableCountrySelection(configurationData.disableCountrySelection)
            .setCountryFilter(countryFilter)
            .setSkipBankSelection(configurationData.skipBankSelection)
            .setSkipAuthentication(configurationData.skipAuthentication)
        
        if let paymentType = KevinPaymentType(string: configurationData.paymentType) {
            _ = configurationBuilder.setPaymentType(paymentType)
        }
        
        if let preselectedBank = configurationData.preselectedBank {
            _ = configurationBuilder.setPreselectedBank(preselectedBank)
        }

        return try configurationBuilder.build()
    }
}
