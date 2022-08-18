import 'package:kevin_flutter_accounts/src/kevin_flutter_method_channel.dart';
import 'package:kevin_flutter_accounts/src/model/account/kevin_account_session_configuration.dart';
import 'package:kevin_flutter_accounts/src/model/account/kevin_accounts_configuration.dart';
import 'package:kevin_flutter_core/kevin.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class KevinAccountsFlutterPlatform extends PlatformInterface {
  KevinAccountsFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static KevinAccountsFlutterPlatform _instance =
      MethodChannelKevinAccountsFlutter();

  /// The default instance of [KevinAccountsFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelKevinFlutter].
  static KevinAccountsFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [KevinAccountsFlutterPlatform] when
  /// they register themselves.
  static set instance(KevinAccountsFlutterPlatform instance) {
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
}
