import 'package:domain/country/model/country.dart';
import 'package:domain/payments/usecase/get_supported_countries_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:support/extension/object.dart';

class FakeGetSupportedCountriesUseCase extends Fake
    implements GetSupportedCountriesUseCase {
  var _countries = <Country>[];
  Exception? _error;

  @override
  Future<List<Country>> invoke() async {
    _error?.let((it) => throw it);

    return _countries;
  }

  void setCountries({required List<Country> countries}) {
    _countries = countries;
  }

  void setError({required Exception error}) {
    _error = error;
  }
}
