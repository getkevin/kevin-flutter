import 'package:kevin_flutter_core/src/kevin_flutter_core_platform_interface.dart';

class Kevin {
  static Kevin? _instance;

  static Kevin get instance {
    _instance ??= Kevin();

    return _instance!;
  }

  Future<void> setLocale(String languageCode) {
    return KevinFlutterCorePlatformInterface.instance.setLocale(languageCode);
  }

  Future<void> setTheme() {
    return KevinFlutterCorePlatformInterface.instance.setTheme();
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
