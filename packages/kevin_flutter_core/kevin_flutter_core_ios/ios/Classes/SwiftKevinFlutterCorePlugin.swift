import Foundation
import Flutter
import UIKit
import kevin_ios

public class SwiftKevinFlutterCorePlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "kevin_flutter_core_ios", binaryMessenger: registrar.messenger())
        let instance = SwiftKevinFlutterCorePlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch KevinMethod(rawValue: call.method) {
        case .setLocale:
            onSetLocale(call: call, result: result)
        case .setTheme:
            onSetTheme(call: call, result: result)
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
    
    private func onSetLocale(call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let lang = (call.arguments as? [String: String])?[KevinMethodArguments.languageCode.rawValue] {
            let locale = Locale(identifier: lang)
            Kevin.shared.locale = locale
        }
        
        result(nil)
    }
    
    private func onSetTheme(call: FlutterMethodCall, result: @escaping FlutterResult) {
        guard let map = (call.arguments as? [String: Any?])?[KevinMethodArguments.theme.rawValue] as? [String: Any?] else {
            result(false)
            return
        }
        
        guard let themeEntity: KevinThemeEntity = try? JsonParser.parseToObject(data: map) else {
            result(false)
            return
        }
        
        Kevin.shared.theme = themeEntity.toKevinTheme()
        result(true)
    }
    
    private func onSetSandbox(call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let isSandbox = (call.arguments as? [String: Bool])?[KevinMethodArguments.sandbox.rawValue] {
            Kevin.shared.isSandbox = isSandbox
        }
        
        result(nil)
    }
    
    private func onSetDeepLinkingEnabled(call: FlutterMethodCall, result: @escaping FlutterResult) {
        if let isDeepLinkingEnabled =
            (call.arguments as? [String: Bool])?[KevinMethodArguments.deepLinkingEnabled.rawValue] {
            Kevin.shared.isDeepLinkingEnabled = isDeepLinkingEnabled
        }
        
        result(nil)
    }
    
    private func onGetLocale(result: @escaping FlutterResult) {
        result(Kevin.shared.locale.identifier)
    }
    
    private func onIsSandbox(result: @escaping FlutterResult) {
        result(Kevin.shared.isSandbox)
    }
    
    private func onIsDeepLinkingEnabled(result: @escaping FlutterResult) {
        result(Kevin.shared.isDeepLinkingEnabled)
    }
}
