import 'package:kevin_flutter_core_platform_interface/src/kevin_flutter_core_method_channel.dart';
import 'package:kevin_flutter_core_platform_interface/src/model/theme/android/kevin_theme_android.dart';
import 'package:kevin_flutter_core_platform_interface/src/model/theme/ios/kevin_theme_ios.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The interface that implementations of kevin_flutter_core must implement.
///
/// Platform implementations should extend this class rather than implement it as `kevin_flutter_core`
/// does not consider newly added methods to be breaking changes. Extending this class
/// (using `extends`) ensures that the subclass will get the default implementation, while
/// platform implementations that `implements` this interface will be broken by newly added
/// [KevinFlutterCorePlatformInterface] methods.
abstract class KevinFlutterCorePlatformInterface extends PlatformInterface {
  KevinFlutterCorePlatformInterface() : super(token: _token);

  static final Object _token = Object();

  static KevinFlutterCorePlatformInterface _instance =
      KevinFlutterCoreMethodChannel();

  /// The default instance of [KevinFlutterCorePlatformInterface] to use.
  ///
  /// Defaults to [KevinFlutterCoreMethodChannel].
  static KevinFlutterCorePlatformInterface get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [KevinFlutterCorePlatformInterface] when
  /// they register themselves.
  static set instance(KevinFlutterCorePlatformInterface instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> setLocale(String languageCode) {
    throw UnimplementedError('Not implemented.');
  }

  Future<bool> setTheme({
    KevinThemeAndroid? androidTheme,
    KevinThemeIos? iosTheme,
  }) {
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
