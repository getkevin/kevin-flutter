import 'package:kevin_flutter_core_platform_interface/kevin_flutter_core_platform_interface.dart';

class Kevin {
  static Future<void> setLocale(String languageCode) {
    return KevinFlutterCorePlatformInterface.instance.setLocale(languageCode);
  }

  /// Sets SDK theme.
  ///
  /// Returns true if theme was set and false otherwise
  static Future<bool> setTheme({
    KevinThemeAndroid? androidTheme,
    KevinThemeIos? iosTheme,
  }) {
    return KevinFlutterCorePlatformInterface.instance.setTheme(
      androidTheme: androidTheme,
      iosTheme: iosTheme,
    );
  }

  static Future<void> setSandbox(bool sandbox) {
    return KevinFlutterCorePlatformInterface.instance.setSandbox(sandbox);
  }

  static Future<void> setDeepLinkingEnabled(bool deepLinkingEnabled) {
    return KevinFlutterCorePlatformInterface.instance
        .setDeepLinkingEnabled(deepLinkingEnabled);
  }

  static Future<String?> getLocale() {
    return KevinFlutterCorePlatformInterface.instance.getLocale();
  }

  static Future<bool> isSandbox() {
    return KevinFlutterCorePlatformInterface.instance.isSandbox();
  }

  static Future<bool> isDeepLinkingEnabled() {
    return KevinFlutterCorePlatformInterface.instance.isDeepLinkingEnabled();
  }
}
