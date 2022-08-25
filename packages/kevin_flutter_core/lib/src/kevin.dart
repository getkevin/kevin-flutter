import 'package:kevin_flutter_core/src/kevin_flutter_core_platform_interface.dart';
import 'package:kevin_flutter_core/src/model/theme/ios/kevin_theme_ios.dart';
import 'package:kevin_flutter_core/src/model/theme/kevin_theme_android.dart';

class Kevin {
  static Kevin? _instance;

  static Kevin get instance {
    _instance ??= Kevin();

    return _instance!;
  }

  Future<void> setLocale(String languageCode) {
    return KevinFlutterCorePlatformInterface.instance.setLocale(languageCode);
  }

  /// Sets SDK theme.
  ///
  /// Returns true if theme was set and false otherwise
  Future<void> setTheme({
    KevinThemeAndroid? androidTheme,
    KevinThemeIos? iosTheme,
  }) {
    return KevinFlutterCorePlatformInterface.instance.setTheme(
      androidTheme: androidTheme,
      iosTheme: iosTheme,
    );
  }

  Future<void> setSandbox(bool sandbox) {
    return KevinFlutterCorePlatformInterface.instance.setSandbox(sandbox);
  }

  Future<void> setDeepLinkingEnabled(bool deepLinkingEnabled) {
    return KevinFlutterCorePlatformInterface.instance
        .setDeepLinkingEnabled(deepLinkingEnabled);
  }

  Future<String?> getLocale() {
    return KevinFlutterCorePlatformInterface.instance.getLocale();
  }

  Future<bool> isSandbox() {
    return KevinFlutterCorePlatformInterface.instance.isSandbox();
  }

  Future<bool> isDeepLinkingEnabled() {
    return KevinFlutterCorePlatformInterface.instance.isDeepLinkingEnabled();
  }
}
