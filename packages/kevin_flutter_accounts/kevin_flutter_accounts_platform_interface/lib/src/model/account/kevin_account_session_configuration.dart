import 'package:kevin_flutter_accounts_platform_interface/src/model/account/kevin_account_linking_type.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';

class KevinAccountSessionConfiguration {
  final String state;
  final KevinCountry? preselectedCountry;
  final bool disabledCountrySelection;
  final List<KevinCountry> countryFilter;
  final List<String> bankFilter;
  final String? preselectedBank;
  final bool skipBankSelection;
  final KevinAccountLinkingType accountLinkingType;

  const KevinAccountSessionConfiguration({
    required this.state,
    this.preselectedCountry,
    this.disabledCountrySelection = false,
    this.countryFilter = const [],
    this.bankFilter = const [],
    this.preselectedBank,
    this.skipBankSelection = false,
    this.accountLinkingType = KevinAccountLinkingType.bank,
  });
}
