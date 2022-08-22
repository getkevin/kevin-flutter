import 'package:kevin_flutter_core/src/kevin_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class KevinFlutterPlatform extends PlatformInterface {
  KevinFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static KevinFlutterPlatform _instance = MethodChannelKevinFlutter();

  /// The default instance of [KevinFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelKevinFlutter].
  static KevinFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [KevinFlutterPlatform] when
  /// they register themselves.
  static set instance(KevinFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> setLocale(String languageCode) {
    throw UnimplementedError('Not implemented.');
  }

  Future<void> setTheme() {
    throw UnimplementedError('Not implemented.');
  }

  Future<void> setSandbox(bool sandbox) {
    throw UnimplementedError('Not implemented.');
  }

  Future<void> setDeepLinkingEnabled(bool deepLinkingEnabled) {
    throw UnimplementedError('Not implemented.');
  }

  Future<String?> getLocale() {
    throw UnimplementedError('Not implemented.');
  }

  Future<bool> isSandbox() {
    throw UnimplementedError('Not implemented.');
  }

  Future<bool> isDeepLinkingEnabled() {
    throw UnimplementedError('Not implemented.');
  }
}
