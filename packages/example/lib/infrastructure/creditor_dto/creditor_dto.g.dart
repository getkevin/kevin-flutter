// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creditor_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreditorDTO _$$_CreditorDTOFromJson(Map<String, dynamic> json) =>
    _$_CreditorDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      accounts: (json['accounts'] as List<dynamic>)
          .map((e) => CreditorAccountDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      logo: json['logo'] as String,
      informationUnstructured: json['informationUnstructured'] as String,
      country: json['country'] as String,
      website: json['website'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
    );

Map<String, dynamic> _$$_CreditorDTOToJson(_$_CreditorDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'accounts': instance.accounts,
      'logo': instance.logo,
      'informationUnstructured': instance.informationUnstructured,
      'country': instance.country,
      'website': instance.website,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
    };
