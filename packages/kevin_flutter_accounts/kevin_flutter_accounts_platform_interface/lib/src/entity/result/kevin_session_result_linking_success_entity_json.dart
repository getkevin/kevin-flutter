part of 'kevin_session_result_linking_success_entity.dart';

KevinSessionResultLinkingSuccessEntity
    _$KevinSessionResultLinkingSuccessEntityFromJson(
  Map<String, dynamic> json,
) =>
        KevinSessionResultLinkingSuccessEntity(
          bank: json['bank'] == null
              ? null
              : KevinBankEntity.fromJson(json['bank'] as Map<String, dynamic>),
          authorizationCode: json['authorizationCode'] as String,
          linkingType: json['linkingType'] as String,
        );

Map<String, dynamic> _$KevinSessionResultLinkingSuccessEntityToJson(
  KevinSessionResultLinkingSuccessEntity instance,
) =>
    <String, dynamic>{
      'bank': instance.bank,
      'authorizationCode': instance.authorizationCode,
      'linkingType': instance.linkingType,
    };
