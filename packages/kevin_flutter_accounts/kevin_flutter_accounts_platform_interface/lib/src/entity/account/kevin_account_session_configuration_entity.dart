import 'package:kevin_flutter_accounts_platform_interface/src/model/account/kevin_account_linking_type.dart';
import 'package:kevin_flutter_accounts_platform_interface/src/model/account/kevin_account_session_configuration.dart';

part 'kevin_account_session_configuration_entity_json.dart';

class KevinAccountSessionConfigurationEntity {
  final String state;
  final String? preselectedCountry;
  final bool disableCountrySelection;
  final List<String> countryFilter;
  final List<String> bankFilter;
  final String? preselectedBank;
  final bool skipBankSelection;
  final KevinAccountLinkingType accountLinkingType;

  const KevinAccountSessionConfigurationEntity({
    required this.state,
    this.preselectedCountry,
    this.disableCountrySelection = false,
    this.countryFilter = const [],
    this.bankFilter = const [],
    this.preselectedBank,
    this.skipBankSelection = false,
    this.accountLinkingType = KevinAccountLinkingType.bank,
  });

  factory KevinAccountSessionConfigurationEntity.fromModel(
    KevinAccountSessionConfiguration model,
  ) =>
      KevinAccountSessionConfigurationEntity(
        state: model.state,
        preselectedBank: model.preselectedBank,
        disableCountrySelection: model.disabledCountrySelection,
        countryFilter: model.countryFilter.map((c) => c.iso).toList(),
        bankFilter: model.bankFilter,
        preselectedCountry: model.preselectedCountry?.iso,
        skipBankSelection: model.skipBankSelection,
        accountLinkingType: model.accountLinkingType,
      );

  Map<String, dynamic> toJson() => _toJson(this);
}
