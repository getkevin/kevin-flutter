import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';
import 'package:kevin_flutter_in_app_payments_platform_interface/kevin_flutter_payments_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockKevinFlutterPaymentsPlatform extends Fake
    with MockPlatformInterfaceMixin
    implements KevinFlutterPaymentsPlatformInterface {
  String? _callbackUrl;

  @override
  Future<void> setPaymentsConfiguration(
    KevinPaymentsConfiguration configuration,
  ) async {
    _callbackUrl = configuration.callbackUrl;
  }

  @override
  Future<KevinSessionResult> startPayment(
    KevinPaymentSessionConfiguration configuration,
  ) async {
    return KevinSessionResultCancelled();
  }

  @override
  Future<String> getCallbackUrl() async {
    return _callbackUrl!;
  }
}
