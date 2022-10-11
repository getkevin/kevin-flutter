import 'package:data/payments/repository/network_payments_data_repository.dart';
import 'package:domain/payments/model/creditor.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fakes/fake_payments_data_api_client.dart';
import '../../test_data.dart';

const _creditor = Creditor(logo: 'logo', name: 'name', accounts: []);

void main() {
  late FakePaymentsDataApiClient apiClient;
  late NetworkPaymentsDataRepository subject;

  setUp(() {
    apiClient = FakePaymentsDataApiClient();
    subject = NetworkPaymentsDataRepository(apiClient: apiClient);
  });

  test('Get supported countries success', () async {
    final result = await subject.getSupportedCountries();

    expect(result, ['LT', 'LV', 'EE']);
  });

  test('Get supported countries error', () async {
    apiClient.setErrors(supportedCountriesError: exception);

    expect(() async => subject.getSupportedCountries(), throwsA(exception));
  });

  test('Get creditors success', () async {
    final result = await subject.getCreditorsByCountry('countryCode');

    expect(result, [_creditor]);
  });

  test('Get creditors error', () async {
    apiClient.setErrors(creditorsError: exception);

    expect(
      () async => subject.getCreditorsByCountry('countryCode'),
      throwsA(exception),
    );
  });
}
