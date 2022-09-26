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
};

class CountryHelper {
  Future<String> getFlag(String countryCode) async {
    final countryCodeLowerCased = countryCode.toLowerCase();

    final flagExists = _availableCountries.contains(countryCodeLowerCased);

    return _getFlagPath(flagExists ? countryCodeLowerCased : 'eu');
  }

  String getName(String countryCode) {
    // TODO: Localisation
    return countryCode;
  }

  String _getFlagPath(String countryCode) =>
      '$_baseFlagsPath/flag_$countryCode.svg';
}
