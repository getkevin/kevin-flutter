import 'package:kevin_flutter_core/kevin_flutter_core.dart';

class KevinAccountSessionConfiguration {
  final String state;
  final KevinCountry? preselectedCountry;
  final bool disableCountrySelection;
  final List<KevinCountry> countryFilter;
  final List<String> bankFilter;
  final String? preselectedBank;
  final bool skipBankSelection;

  const KevinAccountSessionConfiguration({
    required this.state,
    this.preselectedCountry,
    this.disableCountrySelection = false,
    this.countryFilter = const [],
    this.bankFilter = const [],
    this.preselectedBank,
    this.skipBankSelection = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'state': state,
      'preselectedCountry': preselectedCountry?.iso,
      'disableCountrySelection': disableCountrySelection,
      'countryFilter': countryFilter.map((c) => c.iso).toList(),
      'bankFilter': bankFilter,
      'preselectedBank': preselectedBank,
      'skipBankSelection': skipBankSelection,
    };
  }
}
