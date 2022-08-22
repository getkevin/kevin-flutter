import 'package:kevin_flutter_core/kevin.dart';
import 'package:kevin_flutter_in_app_payments/src/kevin_flutter_platform_interface.dart';
import 'package:kevin_flutter_in_app_payments/src/model/payment/kevin_payment_session_configuration.dart';
import 'package:kevin_flutter_in_app_payments/src/model/payment/kevin_payments_configuration.dart';

class KevinPayments {
  static KevinPayments? _instance;

  static KevinPayments get instance {
    _instance ??= KevinPayments();

    return _instance!;
  }

  /// Set payments configuration.
  ///
  /// Payments configuration must be set before starting payment
  /// with [startPayment]
  Future<void> setPaymentsConfiguration(
    KevinPaymentsConfiguration configuration,
  ) {
    return KevinPaymentsFlutterPlatform.instance
        .setPaymentsConfiguration(configuration);
  }

  /// Start payment process.
  ///
  /// Before starting payment, payments configuration must be set
  /// with [setPaymentsConfiguration]
  Future<KevinSessionResult> startPayment(
    KevinPaymentSessionConfiguration configuration,
  ) {
    return KevinPaymentsFlutterPlatform.instance.startPayment(configuration);
  }

  Future<String> getCallbackUrl() {
    return KevinPaymentsFlutterPlatform.instance.getCallbackUrl();
  }
}
