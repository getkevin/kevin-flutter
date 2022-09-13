import 'package:kevin_flutter_core/kevin_flutter_core.dart';
import 'package:kevin_flutter_in_app_payments_platform_interface/kevin_flutter_payments_platform_interface.dart';

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
    return KevinFlutterPaymentsPlatformInterface.instance
        .setPaymentsConfiguration(configuration);
  }

  /// Start payment process.
  ///
  /// Before starting payment, payments configuration must be set
  /// with [setPaymentsConfiguration]
  Future<KevinSessionResult> startPayment(
      KevinPaymentSessionConfiguration configuration,
      ) {
    return KevinFlutterPaymentsPlatformInterface.instance
        .startPayment(configuration);
  }

  Future<String> getCallbackUrl() {
    return KevinFlutterPaymentsPlatformInterface.instance.getCallbackUrl();
  }
}
