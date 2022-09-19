import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_core_platform_interface/kevin_flutter_core_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockKevinFlutterCorePlatform extends Fake
    with MockPlatformInterfaceMixin
    implements KevinFlutterCorePlatformInterface {
  String? _locale;
  bool? _isSandbox;
  bool? _deepLinkingEnabled;

  @override
  Future<void> setLocale(String languageCode) async {
    _locale = languageCode;
  }

  @override
  Future<bool> setTheme({
    KevinThemeAndroid? androidTheme,
    KevinThemeIos? iosTheme,
  }) async {
    return true;
  }

  @override
  Future<void> setSandbox(bool sandbox) async {
    _isSandbox = sandbox;
  }

  @override
  Future<void> setDeepLinkingEnabled(bool deepLinkingEnabled) async {
    _deepLinkingEnabled = deepLinkingEnabled;
  }

  @override
  Future<String?> getLocale() async {
    return _locale;
  }

  @override
  Future<bool> isSandbox() async {
    return _isSandbox!;
  }

  @override
  Future<bool> isDeepLinkingEnabled() async {
    return _deepLinkingEnabled!;
  }
}
