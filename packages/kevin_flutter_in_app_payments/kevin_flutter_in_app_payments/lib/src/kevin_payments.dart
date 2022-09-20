import 'package:kevin_flutter_core/kevin_flutter_core.dart';
import 'package:kevin_flutter_in_app_payments_platform_interface/kevin_flutter_in_app_payments_platform_interface.dart';

class KevinPayments {
  /// Set payments configuration.
  ///
  /// Payments configuration must be set before starting payment
  /// with [startPayment]
  static Future<void> setPaymentsConfiguration(
    KevinPaymentsConfiguration configuration,
  ) {
    return KevinFlutterPaymentsPlatformInterface.instance
        .setPaymentsConfiguration(configuration);
  }

  /// Start payment process.
  ///
  /// Before starting payment, payments configuration must be set
  /// with [setPaymentsConfiguration]
  static Future<KevinSessionResult> startPayment(
    KevinPaymentSessionConfiguration configuration,
  ) {
    return KevinFlutterPaymentsPlatformInterface.instance
        .startPayment(configuration);
  }

  static Future<String> getCallbackUrl() {
    return KevinFlutterPaymentsPlatformInterface.instance.getCallbackUrl();
  }
}
