import 'package:kevin_flutter_accounts_platform_interface/src/kevin_flutter_accounts_method_channel.dart';
import 'package:kevin_flutter_accounts_platform_interface/src/model/account/kevin_account_session_configuration.dart';
import 'package:kevin_flutter_accounts_platform_interface/src/model/account/kevin_accounts_configuration.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// The interface that implementations of kevin_flutter_accounts must implement.
///
/// Platform implementations should extend this class rather than implement it as `kevin_flutter_accounts`
/// does not consider newly added methods to be breaking changes. Extending this class
/// (using `extends`) ensures that the subclass will get the default implementation, while
/// platform implementations that `implements` this interface will be broken by newly added
/// [KevinFlutterAccountsMethodChannel] methods.
abstract class KevinFlutterAccountsPlatformInterface extends PlatformInterface {
  KevinFlutterAccountsPlatformInterface() : super(token: _token);

  static final Object _token = Object();

  static KevinFlutterAccountsPlatformInterface _instance =
      KevinFlutterAccountsMethodChannel();

  /// The default instance of [KevinFlutterAccountsPlatformInterface] to use.
  ///
  /// Defaults to [KevinFlutterAccountsMethodChannel].
  static KevinFlutterAccountsPlatformInterface get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [KevinFlutterAccountsPlatformInterface] when
  /// they register themselves.
  static set instance(KevinFlutterAccountsPlatformInterface instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> setAccountsConfiguration(
    KevinAccountsConfiguration configuration,
  ) {
    throw UnimplementedError('Not implemented.');
  }

  Future<KevinSessionResult> startAccountLinking(
    KevinAccountSessionConfiguration configuration,
  ) {
    throw UnimplementedError('Not implemented.');
  }

  Future<String> getCallbackUrl() {
    throw UnimplementedError('Not implemented.');
  }

  Future<bool> isShowUnsupportedBanks() {
    throw UnimplementedError('Not implemented.');
  }
}
