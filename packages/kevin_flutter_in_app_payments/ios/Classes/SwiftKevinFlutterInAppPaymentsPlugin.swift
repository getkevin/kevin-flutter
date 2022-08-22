import Flutter
import UIKit
import kevin_ios
import kevin_flutter_core

public class SwiftKevinFlutterInAppPaymentsPlugin: NSObject, FlutterPlugin, KevinPaymentSessionDelegate {
    private var paymentResult: FlutterResult? = nil
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "kevin_flutter_payments", binaryMessenger: registrar.messenger())
        let instance = SwiftKevinFlutterInAppPaymentsPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch KevinPaymentsMethod(rawValue: call.method) {
        case .setPaymentsConfiguration:
            onSetPaymentsConfiguration(call: call, result: result)
            break
        case .startPayment:
            onStartPayment(call: call, result: result)
            break
        case .getCallbackUrl:
            onGetCallbackUrl(result: result)
            break
        default:
            result(FlutterMethodNotImplemented)
            break
        }
    }
    
    public func onKevinPaymentInitiationStarted(controller: UINavigationController) {
        UIApplication.shared.delegate!.window!!.rootViewController!
            .present(controller, animated: true, completion: nil)
    }
    
    public func onKevinPaymentCanceled(error: Error?) {
        let parsedError = KevinFlutterErrorParser.parseFlutterError(error: error)
        self.paymentResult?.self(parsedError)
        self.paymentResult = nil
    }
    
    public func onKevinPaymentSucceeded(paymentId: String, status: KevinPaymentStatus) {
        let result = KevinPaymentsSuccess(paymentId: paymentId)
        
        do {
            let data = try JSONEncoder().encode(result)
            let jsonString = String(decoding: data, as: UTF8.self)
            self.paymentResult?.self(jsonString)
            self.paymentResult = nil
        } catch {
            let parsedError = KevinFlutterErrorParser.parseFlutterUnexpectedError(error: error)
            self.paymentResult?.self(parsedError)
            self.paymentResult = nil
        }
    }
    
    private func onSetPaymentsConfiguration(call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let data = call.arguments as? [String: Any?] else {
            result(FlutterError(code: KevinErrorCodes.unexpected, message: "Payments configuration can not be null", details: nil))
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
            result(FlutterError(code: KevinErrorCodes.unexpected, message: "Payment session configuration can not be null", details: nil))
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
        let json = try JSONSerialization.data(withJSONObject: data)
        let configurationData = try JSONDecoder().decode(PaymentsConfigurationEntity.self, from: json)
        
        return KevinInAppPaymentsConfiguration.Builder
            .init(callbackUrl: URL(string: configurationData.callbackUrl)!)
            .build()
    }
    
    private func getPaymentSessionConfiguration(data: [String: Any?]) throws -> KevinPaymentSessionConfiguration {
        let json = try JSONSerialization.data(withJSONObject: data)
        let configurationData = try JSONDecoder().decode(PaymentSessionConfigurationEntity.self, from: json)
        
        var preselectedCountry: KevinCountry?
        if (configurationData.preselectedCountry != nil) {
            preselectedCountry = KevinCountry.init(rawValue: configurationData.preselectedCountry!)
        }
        
        let countryFilter = configurationData.countryFilter.map {
            KevinCountry.init(rawValue: $0)
        }
        
        let configurationBuilder = KevinPaymentSessionConfiguration.Builder
            .init(paymentId: configurationData.paymentId)
            .setPreselectedCountry(preselectedCountry)
            .setDisableCountrySelection(configurationData.disableCountrySelection)
            .setCountryFilter(countryFilter)
            .setSkipAuthentication(configurationData.skipBankSelection)
            .setSkipAuthentication(configurationData.skipAuthentication)
        
        if let paymentType = toKevinPaymentType(string: configurationData.paymentType) {
            _ = configurationBuilder.setPaymentType(paymentType)
        }
        
        if let preselectedBank = configurationData.preselectedBank {
            _ = configurationBuilder.setPreselectedBank(preselectedBank)
        }
        
        
        return try configurationBuilder.build()
    }
    
    private func toKevinPaymentType(string: String) -> KevinPaymentType? {
        switch string.lowercased() {
        case "card":
            return KevinPaymentType.card
        case "bank":
            return KevinPaymentType.bank
        default:
            return nil
        }
    }
}
