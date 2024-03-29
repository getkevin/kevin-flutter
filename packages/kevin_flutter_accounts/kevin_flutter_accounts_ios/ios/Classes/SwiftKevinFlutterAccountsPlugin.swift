import Foundation
import Flutter
import UIKit
import kevin_ios
import kevin_flutter_core_ios

public class SwiftKevinFlutterAccountsPlugin: NSObject, FlutterPlugin, KevinAccountLinkingSessionDelegate {
    private var accountResult: FlutterResult? = nil
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "kevin_flutter_accounts_ios", binaryMessenger: registrar.messenger())
        let instance = SwiftKevinFlutterAccountsPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch KevinAccountsMethod(rawValue: call.method) {
        case .setAccountsConfiguration:
            onSetAccountsConfiguration(call: call, result: result)
        case .startAccountLinking:
            onStartAccountLinking(call: call, result: result)
        case .getCallbackUrl:
            onGetCallbackUrl(result: result)
        case .isShowUnsupportedBanks:
            onIsShowUnsupportedBanks(result: result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    public func onKevinAccountLinkingStarted(controller: UINavigationController) {
        if #available(iOS 13.0, *) {
            controller.isModalInPresentation = true
        }
        UIApplication.shared.delegate!.window!!.rootViewController!
            .present(controller, animated: true, completion: nil)
    }
    
    public func onKevinAccountLinkingCanceled(error: Error?) {
        let parsedError = KevinFlutterErrorParser.parseFlutterError(error: error)
        self.accountResult?(parsedError)
        self.accountResult = nil
    }
    
    public func onKevinAccountLinkingSucceeded(authorizationCode: String, bank: ApiBank?, linkingType: KevinAccountLinkingType) {
        let result = KevinAccountsSuccess(bank: bank?.toKevinBank(), authorizationCode: authorizationCode)
        
        do {
            let jsonString = try JsonParser.parseToJsonString(data: result)
            self.accountResult?(jsonString)
            self.accountResult = nil
        } catch {
            let parsedError = KevinFlutterErrorParser.parseFlutterUnexpectedError(error: error)
            self.accountResult?(parsedError)
            self.accountResult = nil
        }
    }
    
    private func onSetAccountsConfiguration(call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let data = call.arguments as? [String: Any?] else {
            result(KevinFlutterErrorParser.parseFlutterUnexpectedError(message: "Accounts configuration can not be null"))
            return
        }
        
        do {
            let configuration = try getAccountConfiguration(data: data)
            
            KevinAccountsPlugin.shared.configure(configuration)
            result(nil)
        } catch {
            let parsedError = KevinFlutterErrorParser.parseFlutterUnexpectedError(error: error)
            result(parsedError)
        }
    }
    
    private func onStartAccountLinking(call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let data = call.arguments as? [String: Any?] else {
            result(KevinFlutterErrorParser.parseFlutterUnexpectedError(message: "Account linking session configuration can not be null"))
            return
        }
        
        do {
            let accountLinkingConfiguration = try getAccountSessionConfiguration(data: data)
            
            accountResult = result
            
            KevinAccountLinkingSession.shared.delegate = self
            KevinAccountLinkingSession.shared.initiateAccountLinking(configuration: accountLinkingConfiguration)
        } catch {
            let parsedError = KevinFlutterErrorParser.parseFlutterUnexpectedError(error: error)
            result(parsedError)
        }
    }
    
    private func onGetCallbackUrl(result: @escaping FlutterResult) {
        do {
            let callbackUrl = try KevinAccountsPlugin.shared.getCallbackUrl()
            result(callbackUrl.absoluteString)
        } catch {
            let parsedError = KevinFlutterErrorParser.parseFlutterUnexpectedError(error: error)
            result(parsedError)
        }
    }
    
    private func onIsShowUnsupportedBanks(result: @escaping FlutterResult) {
        do {
            let isShowUnsupportedBanks = try !KevinAccountsPlugin.shared.shouldExcludeBanksWithoutAccountLinkingSupport()
            result(isShowUnsupportedBanks)
        } catch {
            let parsedError = KevinFlutterErrorParser.parseFlutterUnexpectedError(error: error)
            result(parsedError)
        }
    }
    
    private func getAccountConfiguration(data: [String: Any?]) throws -> KevinAccountsConfiguration {
        let configurationData : AccountsConfigurationEntity = try JsonParser.parseToObject(data: data)

        return KevinAccountsConfiguration
            .Builder(callbackUrl: URL(string: configurationData.callbackUrl)!)
            .setShowUnsupportedBanks(configurationData.showUnsupportedBanks)
            .build()
    }
    
    private func getAccountSessionConfiguration(data: [String: Any?]) throws -> KevinAccountLinkingSessionConfiguration {
        let configurationData : AccountSessionConfigurationEntity = try JsonParser.parseToObject(data: data)

        var preselectedCountry: KevinCountry?
        if let configurationPreselectedCountry = configurationData.preselectedCountry {
            preselectedCountry = KevinCountry(rawValue: configurationPreselectedCountry)
        }

        let countryFilter = configurationData.countryFilter.map {
            KevinCountry(rawValue: $0)
        }

        let configurationBuilder = KevinAccountLinkingSessionConfiguration
            .Builder(state: configurationData.state)
            .setPreselectedCountry(preselectedCountry)
            .setDisableCountrySelection(configurationData.disableCountrySelection)
            .setCountryFilter(countryFilter)
            .setSkipBankSelection(configurationData.skipBankSelection)
            .setBankFilter(configurationData.bankFilter)
        
        if let preselectedBank = configurationData.preselectedBank {
            _ = configurationBuilder.setPreselectedBank(preselectedBank)
        }

        return try configurationBuilder.build()
    }
}
