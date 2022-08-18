import Flutter
import UIKit
import kevin_ios

public class SwiftKevinFlutterCorePlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "kevin_flutter_core", binaryMessenger: registrar.messenger())
        let instance = SwiftKevinFlutterCorePlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch KevinMethod(rawValue: call.method) {
        case .setLocale:
            onSetLocale(call: call, result: result)
        case .setTheme:
            onSetTheme()
        case .setSandbox:
            onSetSandbox(call: call, result: result)
        case .setDeepLinkingEnabled:
            onSetDeepLinkingEnabled(call: call, result: result)
        case .getLocale:
            onGetLocale(result: result)
        case .isSandbox:
            onIsSandbox(result: result)
        case .isDeepLinkingEnabled:
            onIsDeepLinkingEnabled(result: result)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func onSetLocale(call: FlutterMethodCall, result: @escaping FlutterResult){
        let langArg = (call.arguments as? [String: String])?[KevinMethodArguments.languageCode]
        
        if let lang = langArg {
            let locale = Locale(identifier: lang)
            Kevin.shared.locale = locale
        }
        
        result(nil)
    }
    
    private func onSetTheme(){
        
    }
    
    private func onSetSandbox(call: FlutterMethodCall, result: @escaping FlutterResult){
        let isSandboxArg = (call.arguments as? [String: Bool])?[KevinMethodArguments.sandbox]
        
        if let isSandbox = isSandboxArg {
            Kevin.shared.isSandbox = isSandbox
        }
        
        result(nil)
    }
    
    private func onSetDeepLinkingEnabled(call: FlutterMethodCall, result: @escaping FlutterResult){
        let isDeepLinkingEnabledArg = (call.arguments as? [String: Bool])?[KevinMethodArguments.deepLinkingEnabled]
        
        if let isDeepLinkingEnabled = isDeepLinkingEnabledArg {
            Kevin.shared.isDeepLinkingEnabled = isDeepLinkingEnabled
        }
        
        result(nil)
    }
    
    private func onGetLocale(result: @escaping FlutterResult){
        result(Kevin.shared.locale.identifier)
    }
    
    private func onIsSandbox(result: @escaping FlutterResult){
        result(Kevin.shared.isSandbox)
    }
    
    private func onIsDeepLinkingEnabled(result: @escaping FlutterResult){
        result(Kevin.shared.isDeepLinkingEnabled)
    }
}
