import Flutter
import UIKit

public class SwiftKevinFlutterInAppPaymentsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "kevin_flutter_in_app_payments", binaryMessenger: registrar.messenger())
    let instance = SwiftKevinFlutterInAppPaymentsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
