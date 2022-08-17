import Flutter
import UIKit

public class SwiftKevinFlutterAccountsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "kevin_flutter_accounts", binaryMessenger: registrar.messenger())
    let instance = SwiftKevinFlutterAccountsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
