import 'package:kevin_flutter_accounts_platform_interface/src/model/kevin_bank.dart';

part 'kevin_bank_entity_json.dart';

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

  factory KevinBankEntity.fromJson(Map<String, dynamic> json) => _toJson(json);

  Map<String, dynamic> toJson() => _$KevinBankEntityToJson(this);

  KevinBank toModel() => KevinBank(
        id: id,
        name: name,
        officialName: officialName,
        imageUri: imageUri,
        bic: bic,
      );
}
