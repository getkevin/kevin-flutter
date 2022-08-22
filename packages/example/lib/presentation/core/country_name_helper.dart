String getNameForCountryCode(String? countryCode) {
  if (countryCode == null) {
    return '';
  }

  switch (countryCode.toLowerCase()) {
    case 'at':
      return 'Austria';
    case 'be':
      return 'Belgium';
    case 'bg':
      return 'Bulgaria';
    case 'cz':
      return 'Czech Republic';
    case 'de':
      return 'Germany';
    case 'dk':
      return 'Denmark';
    case 'ee':
      return 'Estonia';
    case 'es':
      return 'Spain';
    case 'fi':
      return 'Finland';
    case 'fr':
      return 'France';
    case 'gb':
      return 'United Kingdom';
    case 'it':
      return 'Italy';
    case 'lt':
      return 'Lithuania';
    case 'lu':
      return 'Luxembourg';
    case 'lv':
      return 'Latvia';
    case 'nl':
      return 'Netherlands';
    case 'no':
      return 'Norway';
    case 'pl':
      return 'Poland';
    case 'pt':
      return 'Portugal';
    case 'ro':
      return 'Romania';
    case 'se':
      return 'Sweden';
    case 'hu':
      return 'Hungary';
    case 'ie':
      return 'Ireland';
    case 'si':
      return 'Slovenia';
    case 'sk':
      return 'Slovakia';
    case 'mt':
      return 'Malta';
    case 'cy':
      return 'Cyprus';
    case 'hr':
      return 'Croatia';
    case 'gr':
      return 'Greece';
    case 'is':
      return 'Iceland';
    case 'li':
      return 'Liechtenstein';
    default:
      return '';
  }
}
