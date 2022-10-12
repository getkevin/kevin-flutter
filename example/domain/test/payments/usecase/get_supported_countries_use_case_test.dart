import 'package:domain/payments/usecase/get_supported_countries_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fakes/fake_country_helper.dart';
import '../../fakes/fake_payments_data_repository.dart';
import '../../test_data.dart';

void main() {
  EquatableConfig.stringify = true;

  late FakePaymentsDataRepository paymentsDataRepository;
  late FakeCountryHelper countryHelper;
  late GetSupportedCountriesUseCase subject;

  setUp(() {
    paymentsDataRepository = FakePaymentsDataRepository();
    countryHelper = FakeCountryHelper();

    paymentsDataRepository
        .setSupportedCountries(supportedCountries: ['LT', 'LV', 'EE']);

    subject = GetSupportedCountriesUseCase(
      repository: paymentsDataRepository,
      countryHelper: countryHelper,
    );
  });

  test('Get supported countries success test', () async {
    final result = await subject.invoke();

    expect(countryHelper.getFlagKeyCallHistory(), ['LT', 'LV', 'EE']);
    expect(countryHelper.getNameKeyCallHistory(), ['LT', 'LV', 'EE']);
    expect(result, [lithuania, latvia, estonia]);
  });

  test('Get supported countries error test', () async {
    paymentsDataRepository.setErrors(supportedCountriesError: exception);

    expect(() async => subject.invoke(), throwsA(exception));
  });
}
