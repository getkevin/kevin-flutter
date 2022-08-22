import Flutter
import UIKit
import kevin_ios

public class SwiftKevinFlutterAccountsPlugin: NSObject, FlutterPlugin, KevinAccountLinkingSessionDelegate {
    private var accountResult: FlutterResult? = nil
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "kevin_flutter_accounts", binaryMessenger: registrar.messenger())
        let instance = SwiftKevinFlutterAccountsPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        let method = KevinMethod(rawValue: call.method)
        
        switch method {
        case .setAccountsConfiguration:
            onSetAccountsConfiguration(call: call, result: result)
            break
        case .startAccountLinking:
            onStartAccountLinking(call: call, result: result)
            break
        case .getCallbackUrl:
            onGetCallbackUrl(result: result)
            break
        case .isShowUnsupportedBanks:
            onIsShowUnsupportedBanks(result: result)
            break
        default:
            result(FlutterMethodNotImplemented)
            break
        }
    }
    
    public func onKevinAccountLinkingStarted(controller: UINavigationController) {
        UIApplication.shared.delegate!.window!!.rootViewController!
            .present(controller, animated: true, completion: nil)
    }
    
    public func onKevinAccountLinkingCanceled(error: Error?) {
        self.accountResult?.self(parseFlutterError(error: error))
        self.accountResult = nil
    }
    
    public func onKevinAccountLinkingSucceeded(authorizationCode: String, bank: ApiBank?, linkingType: KevinAccountLinkingType) {
        let result = KevinAccountsSuccess(bank: bank?.toKevinBank(), authorizationCode: authorizationCode, linkingType: linkingType.toString())
        
        do {
            let data = try JSONEncoder().encode(result)
            let jsonString = String(decoding: data, as: UTF8.self)
            self.accountResult?.self(jsonString)
            self.accountResult = nil
        } catch {
            self.accountResult?.self(parseFlutterUnexpectedError(error: error))
            self.accountResult = nil
        }
    }
    
    private func onSetAccountsConfiguration(call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let data = call.arguments as? [String: Any?] else {
            result(FlutterError(code: KevinErrorCodes.unexpected, message: "Accounts configuration can not be null", details: nil))
            return
        }
        
        do {
            let configuration = try getAccountConfiguration(data: data)
            
            KevinAccountsPlugin.shared.configure(configuration)
            result(nil)
        } catch {
            result(parseFlutterUnexpectedError(error: error))
        }
    }
    
    private func onStartAccountLinking(call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let data = call.arguments as? [String: Any?] else {
            result(FlutterError(code: KevinErrorCodes.unexpected, message: "Account linking session configuration can not be null", details: nil))
            return
        }
        
        do {
            let accountLinkingConfiguration = try getAccountSessionConfiguration(data: data)
            
            accountResult = result
            
            KevinAccountLinkingSession.shared.delegate = self
            KevinAccountLinkingSession.shared.initiateAccountLinking(configuration: accountLinkingConfiguration)
        } catch {
            result(parseFlutterUnexpectedError(error: error))
        }
    }
    
    private func onGetCallbackUrl(result: @escaping FlutterResult) {
        do {
            let callbackUrl = try KevinAccountsPlugin.shared.getCallbackUrl()
            result(callbackUrl.absoluteString)
        } catch {
            result(parseFlutterUnexpectedError(error: error))
        }
    }
    
    private func onIsShowUnsupportedBanks(result: @escaping FlutterResult) {
        do {
            let isShowUnsupportedBanks = try !KevinAccountsPlugin.shared.shouldExcludeBanksWithoutAccountLinkingSupport()
            result(isShowUnsupportedBanks)
        } catch {
            result(parseFlutterUnexpectedError(error: error))
        }
    }
    
    private func getAccountConfiguration(data: [String: Any?]) throws -> KevinAccountsConfiguration {
        let json = try JSONSerialization.data(withJSONObject: data)
        let configurationData = try JSONDecoder().decode(AccountsConfigurationEntity.self, from: json)
        
        return KevinAccountsConfiguration.Builder
            .init(callbackUrl: URL(string: configurationData.callbackUrl)!)
            .setShowUnsupportedBanks(configurationData.showUnsupportedBanks)
            .build()
    }
    
    private func getAccountSessionConfiguration(data: [String: Any?]) throws -> KevinAccountLinkingSessionConfiguration {
        let json = try JSONSerialization.data(withJSONObject: data)
        let configurationData = try JSONDecoder().decode(AccountSessionConfigurationEntity.self, from: json)
        
        var preselectedCountry: KevinCountry?
        if (configurationData.preselectedCountry != nil) {
            preselectedCountry = KevinCountry.init(rawValue: configurationData.preselectedCountry!)
        }
        
        let countryFilter = configurationData.countryFilter.map {
            KevinCountry.init(rawValue: $0)
        }
        
        let configurationBuilder = KevinAccountLinkingSessionConfiguration.Builder
            .init(state: configurationData.state)
            .setPreselectedCountry(preselectedCountry)
            .setDisableCountrySelection(configurationData.disableCountrySelection)
            .setCountryFilter(countryFilter)
            .setSkipBankSelection(configurationData.skipBankSelection)
        
        if let preselectedBank = configurationData.preselectedBank {
            _ = configurationBuilder.setPreselectedBank(preselectedBank)
        }
        
        if let accountLinkingType = toKevinAccountLinkingType(string: configurationData.accountLinkingType) {
            _ = configurationBuilder.setLinkingType(accountLinkingType)
        }
        
        
        return try configurationBuilder.build()
    }
    
    private func parseFlutterUnexpectedError(error: Error) -> FlutterError {
        return parseFlutterError(error: error, defaultCode: KevinErrorCodes.unexpected)
    }
    
    private func parseFlutterError(error: Error?, defaultCode: String = KevinErrorCodes.general) -> FlutterError {
        let errorCode: String
        var errorDescription: String? = nil
        
        switch error {
        case is KevinCancelationError:
            errorCode = KevinErrorCodes.cancelled
            break
        case is KevinError:
            errorCode = defaultCode
            errorDescription = (error as! KevinError).description
            break
        default:
            errorCode = defaultCode
            errorDescription = error?.localizedDescription
            break
        }
        
        return FlutterError(code: errorCode, message: errorDescription, details: nil)
    }
}
