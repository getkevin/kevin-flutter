import 'package:domain/kevin/model/payment.dart';
import 'package:domain/payments/usecase/initialize_linked_payment_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fakes/fake_get_auth_token_use_case.dart';
import '../../fakes/fake_kevin_repository.dart';
import '../../test_data.dart';

void main() {
  EquatableConfig.stringify = true;

  late FakeKevinRepository kevinRepository;
  late FakeGetAuthTokenUseCase getAuthTokenUseCase;
  late InitializeLinkedPaymentUseCase subject;

  setUp(() {
    kevinRepository = FakeKevinRepository();
    getAuthTokenUseCase = FakeGetAuthTokenUseCase();
    subject = InitializeLinkedPaymentUseCase(
      kevinRepository: kevinRepository,
      getAuthTokenUseCase: getAuthTokenUseCase,
    );
  });

  test('Initialize linked payment success test', () async {
    final result = await subject.invoke(
      linkedAccount: linkedAccount,
      paymentRequest: paymentRequest,
    );

    expect(kevinRepository.getLinkedCallHistory(), [paymentRequest]);
    expect(getAuthTokenUseCase.getCallHistory(), ['linkToken']);
    expect(result, const Payment(id: 'linkedPaymentId'));
  });

  test('Initialize linked payment error test', () async {
    getAuthTokenUseCase.setError(error: exception);

    expect(
      () async => subject.invoke(
        linkedAccount: linkedAccount,
        paymentRequest: paymentRequest,
      ),
      throwsA(exception),
    );
    expect(getAuthTokenUseCase.getCallHistory(), ['linkToken']);
  });
}
