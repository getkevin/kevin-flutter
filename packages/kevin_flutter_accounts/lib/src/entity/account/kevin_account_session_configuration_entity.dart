import 'package:json_annotation/json_annotation.dart';
import 'package:kevin_flutter_accounts/src/model/account/kevin_account_linking_type.dart';
import 'package:kevin_flutter_accounts/src/model/account/kevin_account_session_configuration.dart';

part 'kevin_account_session_configuration_entity.g.dart';

@JsonSerializable(createToJson: true, createFactory: false)
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
        preselectedBank: model.preselectedCountry?.iso,
        disableCountrySelection: model.disabledCountrySelection,
        countryFilter: model.countryFilter.map((c) => c.iso).toList(),
        bankFilter: model.bankFilter,
        preselectedCountry: model.preselectedBank,
        skipBankSelection: model.skipBankSelection,
        accountLinkingType: model.accountLinkingType,
      );

  Map<String, dynamic> toJson() =>
      _$KevinAccountSessionConfigurationEntityToJson(this);
}
