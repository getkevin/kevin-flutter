import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:kevin_flutter_core_platform_interface/kevin_flutter_core_platform_interface.dart';

@visibleForTesting
const methodChannel = MethodChannel('kevin_flutter_core_ios');

class KevinFlutterCoreIos extends KevinFlutterCorePlatformInterface {
  static void registerWith() {
    KevinFlutterCorePlatformInterface.instance = KevinFlutterCoreIos();
  }

  @override
  Future<void> setLocale(String languageCode) async {
    await methodChannel.invokeMethod(KevinFlutterCoreMethods.setLocale, {
      KevinFlutterCoreArguments.languageCode: languageCode,
    });
  }

  @override
  Future<bool> setTheme({
    KevinThemeAndroid? androidTheme,
    KevinThemeIos? iosTheme,
  }) async {
    if (iosTheme == null) return false;

    final arguments = <String, dynamic>{
      KevinFlutterCoreArguments.theme: iosTheme.toMap()
    };

    final themeSet = await methodChannel.invokeMethod<bool>(
      KevinFlutterCoreMethods.setTheme,
      arguments,
    );

    return themeSet!;
  }

  @override
  Future<void> setSandbox(bool sandbox) async {
    await methodChannel.invokeMethod(KevinFlutterCoreMethods.setSandbox, {
      KevinFlutterCoreArguments.sandbox: sandbox,
    });
  }

  @override
  Future<void> setDeepLinkingEnabled(bool deepLinkingEnabled) async {
    await methodChannel
        .invokeMethod(KevinFlutterCoreMethods.setDeepLinkingEnabled, {
      KevinFlutterCoreArguments.deepLinkingEnabled: deepLinkingEnabled,
    });
  }

  @override
  Future<String?> getLocale() async {
    return methodChannel
        .invokeMethod<String?>(KevinFlutterCoreMethods.getLocale);
  }

  @override
  Future<bool> isSandbox() async {
    final isSandbox = await methodChannel
        .invokeMethod<bool>(KevinFlutterCoreMethods.isSandbox);
    return isSandbox!;
  }

  @override
  Future<bool> isDeepLinkingEnabled() async {
    final isDeepLinkingEnabled = await methodChannel
        .invokeMethod(KevinFlutterCoreMethods.isDeepLinkingEnabled);
    return isDeepLinkingEnabled!;
  }
}
