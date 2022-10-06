import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';
import 'package:kevin_flutter_in_app_payments/kevin_flutter_in_app_payments.dart';
import 'package:kevin_flutter_in_app_payments_platform_interface/kevin_flutter_in_app_payments_platform_interface.dart';

import '../mocks/mock_kevin_flutter_payments_platform.dart';

void main() {
  setUp(() {
    KevinFlutterPaymentsPlatformInterface.instance =
        MockKevinFlutterPaymentsPlatform();
  });

  test('setPaymentsConfiguration/getCallbackUrl', () async {
    await KevinPayments.setPaymentsConfiguration(
      const KevinPaymentsConfiguration(
        callbackUrl: KevinCallbackUrl(android: 'android', ios: 'ios'),
      ),
    );

    final callbackUrl = await KevinPayments.getCallbackUrl();

    expect(callbackUrl, 'android');
  });

  test('startPayment', () async {
    final result = await KevinPayments.startPayment(
      const KevinPaymentSessionConfiguration(paymentId: 'paymentId'),
    );

    expect(result, isA<KevinSessionResultCancelled>());
  });
}
