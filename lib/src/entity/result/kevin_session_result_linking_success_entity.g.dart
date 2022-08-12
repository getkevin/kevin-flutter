// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kevin_session_result_linking_success_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KevinSessionResultLinkingSuccessEntity
    _$KevinSessionResultLinkingSuccessEntityFromJson(
            Map<String, dynamic> json) =>
        KevinSessionResultLinkingSuccessEntity(
          bank: json['bank'] == null
              ? null
              : KevinBankEntity.fromJson(json['bank'] as Map<String, dynamic>),
          authorizationCode: json['authorizationCode'] as String,
          linkingType: json['linkingType'] as String,
        );
