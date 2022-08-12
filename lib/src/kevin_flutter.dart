import 'package:kevin_flutter/src/kevin_flutter_platform_interface.dart';
import 'package:kevin_flutter/src/model/account/kevin_account_session_configuration.dart';
import 'package:kevin_flutter/src/model/account/kevin_accounts_configuration.dart';
import 'package:kevin_flutter/src/model/kevin_session_result.dart';
import 'package:kevin_flutter/src/model/payment/kevin_payment_session_configuration.dart';
import 'package:kevin_flutter/src/model/payment/kevin_payments_configuration.dart';

class KevinFlutter {
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

  /// Set payments configuration.
  ///
  /// Payments configuration must be set before starting payment
  /// with [startPayment]
  Future<void> setPaymentsConfiguration(
    KevinPaymentsConfiguration configuration,
  ) {
    return KevinFlutterPlatform.instance
        .setPaymentsConfiguration(configuration);
  }

  /// Set accounts configuration.
  ///
  /// Accounts configuration must be set before starting account
  /// linking with [startAccountLinking]
  Future<void> setAccountsConfiguration(
    KevinAccountsConfiguration configuration,
  ) {
    return KevinFlutterPlatform.instance
        .setAccountsConfiguration(configuration);
  }

  /// Start account linking process.
  ///
  /// Before account linking, accounts configuration must be set
  /// with [setAccountsConfiguration]
  Future<KevinSessionResult> startAccountLinking(
    KevinAccountSessionConfiguration configuration,
  ) {
    return KevinFlutterPlatform.instance.startAccountLinking(configuration);
  }

  /// Start payment process.
  ///
  /// Before starting payment, payments configuration must be set
  /// with [setPaymentsConfiguration]
  Future<KevinSessionResult> startPayment(
    KevinPaymentSessionConfiguration configuration,
  ) {
    return KevinFlutterPlatform.instance.startPayment(configuration);
  }
}
