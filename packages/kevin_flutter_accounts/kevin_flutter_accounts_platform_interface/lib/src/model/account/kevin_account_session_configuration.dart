import 'package:kevin_flutter_accounts_platform_interface/src/model/account/kevin_account_linking_type.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';

class KevinAccountSessionConfiguration {
  final String state;
  final KevinCountry? preselectedCountry;
  final bool disableCountrySelection;
  final List<KevinCountry> countryFilter;
  final List<String> bankFilter;
  final String? preselectedBank;
  final bool skipBankSelection;
  final KevinAccountLinkingType accountLinkingType;

  const KevinAccountSessionConfiguration({
    required this.state,
    this.preselectedCountry,
    this.disableCountrySelection = false,
    this.countryFilter = const [],
    this.bankFilter = const [],
    this.preselectedBank,
    this.skipBankSelection = false,
    this.accountLinkingType = KevinAccountLinkingType.bank,
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
      'accountLinkingType': accountLinkingType.name,
    };
  }
}
