import 'package:domain/kevin/model/payment.dart';
import 'package:domain/payments/model/payment_type.dart';
import 'package:domain/payments/usecase/initialize_single_payment_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fakes/fake_kevin_repository.dart';
import '../../test_data.dart';

void main() {
  EquatableConfig.stringify = true;

  late FakeKevinRepository kevinRepository;
  late InitializeSinglePaymentUseCase subject;

  setUp(() {
    kevinRepository = FakeKevinRepository();
    subject = InitializeSinglePaymentUseCase(kevinRepository: kevinRepository);
  });

  test('Bank payment success test', () async {
    final result = await subject.invoke(
      paymentType: PaymentType.bank,
      paymentRequest: paymentRequest,
    );

    expect(kevinRepository.getBankCallHistory(), [paymentRequest]);
    expect(result, const Payment(id: 'bankPaymentId'));
  });

  test('Bank payment error test', () async {
    kevinRepository.setErrors(bankError: exception);

    expect(
      () async => subject.invoke(
        paymentType: PaymentType.bank,
        paymentRequest: paymentRequest,
      ),
      throwsA(exception),
    );
  });

  test('Card payment success test', () async {
    final result = await subject.invoke(
      paymentType: PaymentType.card,
      paymentRequest: paymentRequest,
    );

    expect(kevinRepository.getCardCallHistory(), [paymentRequest]);
    expect(result, const Payment(id: 'cardPaymentId'));
  });

  test('Card payment error test', () async {
    kevinRepository.setErrors(cardError: exception);

    expect(
      () async => subject.invoke(
        paymentType: PaymentType.card,
        paymentRequest: paymentRequest,
      ),
      throwsA(exception),
    );
  });

  test('Linked payment is not supported test', () async {
    expect(
      () async => subject.invoke(
        paymentType: PaymentType.linked,
        paymentRequest: paymentRequest,
      ),
      throwsA(isA<StateError>()),
    );
  });
}
