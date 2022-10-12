import 'package:domain/country/country_helper.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeCountryHelper extends Fake implements CountryHelper {
  var _supportedCountryCodes = <String>{};
  final _flagKeyCallHistory = <String>[];
  final _nameKeyCallHistory = <String>[];

  @override
  String getFlagKey(String countryCode) {
    _flagKeyCallHistory.add(countryCode);

    return countryCode;
  }

  @override
  String getNameKey(String countryCode) {
    _nameKeyCallHistory.add(countryCode);

    return countryCode;
  }

  @override
  Set<String> getSupportedCountryCodes() => _supportedCountryCodes;

  void setSupportedCountryCodes({required Set<String> supportedCountryCodes}) {
    _supportedCountryCodes = supportedCountryCodes;
  }

  List<String> getFlagKeyCallHistory() => List.of(_flagKeyCallHistory);

  List<String> getNameKeyCallHistory() => List.of(_nameKeyCallHistory);
}
