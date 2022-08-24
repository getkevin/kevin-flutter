import 'package:json_annotation/json_annotation.dart';
import 'package:kevin_flutter_accounts/src/model/kevin_accounts_models.dart';

part 'kevin_bank_entity.g.dart';

@JsonSerializable(createToJson: true, createFactory: true)
class KevinBankEntity {
  final String id;
  final String name;
  final String? officialName;
  final String imageUri;
  final String? bic;

  const KevinBankEntity({
    required this.id,
    required this.name,
    required this.officialName,
    required this.imageUri,
    required this.bic,
  });

  factory KevinBankEntity.fromJson(Map<String, dynamic> json) =>
      _$KevinBankEntityFromJson(json);

  Map<String, dynamic> toJson() => _$KevinBankEntityToJson(this);

  KevinBank toModel() => KevinBank(
        id: id,
        name: name,
        officialName: officialName,
        imageUri: imageUri,
        bic: bic,
      );
}
