import Flutter
import UIKit

public class SwiftKevinFlutterCorePlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "kevin_flutter_core", binaryMessenger: registrar.messenger())
        let instance = SwiftKevinFlutterCorePlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result("iOS " + UIDevice.current.systemVersion)
    }
    
    private func onSetLocale(){
        
    }
    
    private func onSetTheme(){
        
    }
    
    private func onSetDeepLinkingEnabled(){
        
    }
    
    private func onGetLocale(){
        
    }
    
    private func onIsSandbox(){
        
    }
    
    private func onIsDeepLinkingEnabled(){
        
    }
}
