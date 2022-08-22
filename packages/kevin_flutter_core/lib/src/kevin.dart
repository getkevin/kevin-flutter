import 'package:kevin_flutter_core/src/kevin_flutter_platform_interface.dart';

class Kevin {
  static Kevin? _instance;

  static Kevin get instance {
    _instance ??= Kevin();

    return _instance!;
  }

  Future<void> setLocale(String languageCode) {
    return KevinFlutterPlatform.instance.setLocale(languageCode);
  }

  Future<void> setTheme() {
    return KevinFlutterPlatform.instance.setTheme();
  }

  Future<void> setSandbox(bool sandbox) {
    return KevinFlutterPlatform.instance.setSandbox(sandbox);
  }

  Future<void> setDeepLinkingEnabled(bool deepLinkingEnabled) {
    return KevinFlutterPlatform.instance
        .setDeepLinkingEnabled(deepLinkingEnabled);
  }

  Future<String?> getLocale() {
    return KevinFlutterPlatform.instance.getLocale();
  }

  Future<bool> isSandbox() {
    return KevinFlutterPlatform.instance.isSandbox();
  }

  Future<bool> isDeepLinkingEnabled() {
    return KevinFlutterPlatform.instance.isDeepLinkingEnabled();
  }
}
