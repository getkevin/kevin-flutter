part of 'kevin_payment_session_configuration_entity.dart';

Map<String, dynamic> _toJson(
  KevinPaymentSessionConfigurationEntity instance,
) =>
    <String, dynamic>{
      'paymentId': instance.paymentId,
      'paymentType': _$KevinPaymentTypeEnumMap[instance.paymentType]!,
      'preselectedCountry': instance.preselectedCountry,
      'disableCountrySelection': instance.disableCountrySelection,
      'countryFilter': instance.countryFilter,
      'bankFilter': instance.bankFilter,
      'preselectedBank': instance.preselectedBank,
      'skipBankSelection': instance.skipBankSelection,
      'skipAuthentication': instance.skipAuthentication,
    };

const _$KevinPaymentTypeEnumMap = {
  KevinPaymentType.bank: 'bank',
  KevinPaymentType.card: 'card',
};