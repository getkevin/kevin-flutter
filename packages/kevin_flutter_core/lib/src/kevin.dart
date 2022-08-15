import 'package:kevin_flutter_core/src/kevin_flutter_platform_interface.dart';

class Kevin {
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
}
