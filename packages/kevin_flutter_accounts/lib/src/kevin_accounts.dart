import 'package:kevin_flutter_accounts/src/kevin_flutter_platform_interface.dart';
import 'package:kevin_flutter_accounts/src/model/account/kevin_account_session_configuration.dart';
import 'package:kevin_flutter_accounts/src/model/account/kevin_accounts_configuration.dart';
import 'package:kevin_flutter_core/kevin.dart';

class KevinAccounts {
  static KevinAccounts? _instance;

  static KevinAccounts get instance {
    _instance ??= KevinAccounts();

    return _instance!;
  }

  /// Set accounts configuration.
  ///
  /// Accounts configuration must be set before starting account
  /// linking with [startAccountLinking]
  Future<void> setAccountsConfiguration(
    KevinAccountsConfiguration configuration,
  ) {
    return KevinAccountsFlutterPlatform.instance
        .setAccountsConfiguration(configuration);
  }

  /// Start account linking process.
  ///
  /// Before account linking, accounts configuration must be set
  /// with [setAccountsConfiguration]
  Future<KevinSessionResult> startAccountLinking(
    KevinAccountSessionConfiguration configuration,
  ) {
    return KevinAccountsFlutterPlatform.instance
        .startAccountLinking(configuration);
  }

  Future<String> getCallbackUrl() {
    return KevinAccountsFlutterPlatform.instance.getCallbackUrl();
  }

  Future<bool> isShowUnsupportedBanks() {
    return KevinAccountsFlutterPlatform.instance.isShowUnsupportedBanks();
  }
}
