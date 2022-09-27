// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creditors_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditorsEntity _$CreditorsEntityFromJson(Map<String, dynamic> json) =>
    CreditorsEntity(
      data: (json['data'] as List<dynamic>)
          .map((e) => CreditorEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

CreditorEntity _$CreditorEntityFromJson(Map<String, dynamic> json) =>
    CreditorEntity(
      logo: json['logo'] as String,
      name: json['name'] as String,
      accounts: (json['accounts'] as List<dynamic>)
          .map((e) => CreditorAccountEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

CreditorAccountEntity _$CreditorAccountEntityFromJson(
        Map<String, dynamic> json) =>
    CreditorAccountEntity(
      currencyCode: json['currencyCode'] as String,
      iban: json['iban'] as String,
    );
