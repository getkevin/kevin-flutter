import 'package:domain/country/country_helper.dart';

const _baseFlagsPath = 'resources/flags';

final _availableCountries = {
  'at',
  'be',
  'bg',
  'cy',
  'cz',
  'de',
  'dk',
  'ee',
  'es',
  'eu',
  'fi',
  'fr',
  'gb',
  'gr',
  'hr',
  'ic',
  'ie',
  'it',
  'li',
  'lt',
  'lu',
  'lv',
  'mt',
  'nl',
  'no',
  'pl',
  'pt',
  'ro',
  'se',
  'si',
  'sk',
  'hu',
};

class LocalResourcesCountryHelper extends CountryHelper {
  @override
  String getFlagKey(String countryCode) {
    final countryCodeLowerCased = countryCode.toLowerCase();

    final flagExists = _availableCountries.contains(countryCodeLowerCased);

    return _getFlagPath(flagExists ? countryCodeLowerCased : 'eu');
  }

  @override
  String getNameKey(String countryCode) {
    final countryCodeLowerCased = countryCode.toLowerCase();

    final translationExists =
        _availableCountries.contains(countryCodeLowerCased);

    return translationExists
        ? _getLocaleKey(countryCodeLowerCased)
        : countryCode;
  }

  @override
  Set<String> getSupportedCountryCodes() {
    return _availableCountries;
  }

  String _getFlagPath(String countryCode) =>
      '$_baseFlagsPath/flag_$countryCode.svg';

  String _getLocaleKey(String countryCode) => 'country_$countryCode';
}
