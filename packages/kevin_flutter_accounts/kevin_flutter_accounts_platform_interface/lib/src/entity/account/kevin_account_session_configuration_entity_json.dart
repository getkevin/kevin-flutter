part of 'kevin_account_session_configuration_entity.dart';

Map<String, dynamic> _toJson(
  KevinAccountSessionConfigurationEntity instance,
) =>
    <String, dynamic>{
      'state': instance.state,
      'preselectedCountry': instance.preselectedCountry,
      'disableCountrySelection': instance.disableCountrySelection,
      'countryFilter': instance.countryFilter,
      'bankFilter': instance.bankFilter,
      'preselectedBank': instance.preselectedBank,
      'skipBankSelection': instance.skipBankSelection,
      'accountLinkingType':
          _$KevinAccountLinkingTypeEnumMap[instance.accountLinkingType]!,
    };

const _$KevinAccountLinkingTypeEnumMap = {
  KevinAccountLinkingType.bank: 'bank',
  KevinAccountLinkingType.card: 'card',
};
