import 'package:kevin_flutter_accounts_platform_interface/kevin_flutter_accounts_platform_interface.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';

class KevinAccounts {
  /// Set accounts configuration.
  ///
  /// Accounts configuration must be set before starting account
  /// linking with [startAccountLinking]
  static Future<void> setAccountsConfiguration(
    KevinAccountsConfiguration configuration,
  ) {
    return KevinFlutterAccountsPlatformInterface.instance
        .setAccountsConfiguration(configuration);
  }

  /// Start account linking process.
  ///
  /// Before account linking, accounts configuration must be set
  /// with [setAccountsConfiguration]
  static Future<KevinSessionResult> startAccountLinking(
    KevinAccountSessionConfiguration configuration,
  ) {
    return KevinFlutterAccountsPlatformInterface.instance
        .startAccountLinking(configuration);
  }

  static Future<String> getCallbackUrl() {
    return KevinFlutterAccountsPlatformInterface.instance.getCallbackUrl();
  }

  static Future<bool> isShowUnsupportedBanks() {
    return KevinFlutterAccountsPlatformInterface.instance
        .isShowUnsupportedBanks();
  }
}
