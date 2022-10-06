import 'package:domain/country/country_helper.dart';
import 'package:domain/country/model/country.dart';
import 'package:domain/payments/repository/payments_data_repository.dart';

class GetSupportedCountriesUseCase {
  final PaymentsDataRepository _repository;
  final CountryHelper _countryHelper;

  const GetSupportedCountriesUseCase({
    required PaymentsDataRepository repository,
    required CountryHelper countryHelper,
  })  : _repository = repository,
        _countryHelper = countryHelper;

  Future<List<Country>> invoke() async {
    final countryCodes = await _repository.getSupportedCountries();
    final countries = countryCodes
        .map(
          (code) => Country(
            code: code,
            flagKey: _countryHelper.getFlagKey(code),
            nameKey: _countryHelper.getNameKey(code),
          ),
        )
        .toList();
    return countries;
  }
}
