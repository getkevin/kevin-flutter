import 'package:domain/accounts/model/linked_account.dart';
import 'package:domain/kevin/model/payment.dart';
import 'package:domain/kevin/model/payment_request.dart';
import 'package:domain/payments/usecase/initialize_linked_payment_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:support/extension/object.dart';

class FakeInitializeLinkedPaymentUseCase extends Fake
    implements InitializeLinkedPaymentUseCase {
  final _requestHistory = <Map<LinkedAccount, PaymentRequest>>[];
  Exception? _error;

  @override
  Future<Payment> invoke({
    required LinkedAccount linkedAccount,
    required PaymentRequest paymentRequest,
  }) async {
    _requestHistory.add({linkedAccount: paymentRequest});

    _error?.let((it) => throw it);

    return const Payment(id: 'linkedPaymentId');
  }

  void setError({required Exception error}) {
    _error = error;
  }

  List<Map<LinkedAccount, PaymentRequest>> getRequestHistory() =>
      List.of(_requestHistory);
}
