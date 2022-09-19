part of 'kevin_bank_entity.dart';

KevinBankEntity _toJson(Map<String, dynamic> json) =>
    KevinBankEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      officialName: json['officialName'] as String?,
      imageUri: json['imageUri'] as String,
      bic: json['bic'] as String?,
    );

Map<String, dynamic> _$KevinBankEntityToJson(KevinBankEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'officialName': instance.officialName,
      'imageUri': instance.imageUri,
      'bic': instance.bic,
    };