import 'package:domain/kevin/model/payment.dart';
import 'package:domain/kevin/model/payment_request.dart';
import 'package:domain/payments/model/payment_type.dart';
import 'package:domain/payments/usecase/initialize_single_payment_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:support/extension/object.dart';

class FakeInitializeSinglePaymentUseCase extends Fake
    implements InitializeSinglePaymentUseCase {
  final _requestHistory = <Map<PaymentType, PaymentRequest>>[];
  Exception? _error;

  @override
  Future<Payment> invoke({
    required PaymentType paymentType,
    required PaymentRequest paymentRequest,
  }) async {
    _requestHistory.add({paymentType: paymentRequest});

    _error?.let((it) => throw it);

    return Payment(id: '${paymentType.name}PaymentId');
  }

  void setError({required Exception error}) {
    _error = error;
  }

  List<Map<PaymentType, PaymentRequest>> getRequestHistory() =>
      List.of(_requestHistory);
}
