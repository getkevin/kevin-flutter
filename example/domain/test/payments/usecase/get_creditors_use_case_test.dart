import 'package:domain/payments/model/creditor.dart';
import 'package:domain/payments/usecase/get_creditors_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fakes/fake_payments_data_repository.dart';
import '../../test_data.dart';

const _creditor = Creditor(logo: 'logo', name: 'name', accounts: []);

void main() {
  EquatableConfig.stringify = true;

  late FakePaymentsDataRepository paymentsDataRepository;
  late GetCreditorsUseCase subject;

  setUp(() {
    paymentsDataRepository = FakePaymentsDataRepository();

    paymentsDataRepository.setCreditors(
      creditors: [_creditor],
    );

    subject = GetCreditorsUseCase(repository: paymentsDataRepository);
  });

  test('Get creditors success test', () async {
    final result = await subject.invoke('LT');

    expect(paymentsDataRepository.getCreditorsCallHistory(), ['LT']);
    expect(result, [_creditor]);
  });

  test('Get creditors error test', () async {
    paymentsDataRepository.setErrors(creditorsError: exception);

    expect(() async => subject.invoke('LT'), throwsA(exception));
    expect(paymentsDataRepository.getCreditorsCallHistory(), ['LT']);
  });

  test('Substitutes non-LT country to EE country test', () async {
    final result = await subject.invoke('LV');

    expect(paymentsDataRepository.getCreditorsCallHistory(), ['EE']);
    expect(result, [_creditor]);
  });
}
