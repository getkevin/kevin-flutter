import 'package:domain/payments/model/creditor.dart';
import 'package:domain/payments/model/creditor_account.dart';
import 'package:json_annotation/json_annotation.dart';

part 'creditors_entity.g.dart';

@JsonSerializable(createToJson: false)
class CreditorsEntity {
  final List<CreditorEntity> data;

  const CreditorsEntity({
    required this.data,
  });

  factory CreditorsEntity.fromJson(Map<String, dynamic> json) =>
      _$CreditorsEntityFromJson(json);

  List<Creditor> toModel() => data.map((c) => c.toModel()).toList();
}

@JsonSerializable(createToJson: false)
class CreditorEntity {
  final String logo;
  final String name;
  final List<CreditorAccountEntity> accounts;

  const CreditorEntity({
    required this.logo,
    required this.name,
    required this.accounts,
  });

  factory CreditorEntity.fromJson(Map<String, dynamic> json) =>
      _$CreditorEntityFromJson(json);

  Creditor toModel() => Creditor(
        logo: logo,
        name: name,
        accounts: accounts.map((a) => a.toModel()).toList(),
      );
}

@JsonSerializable(createToJson: false)
class CreditorAccountEntity {
  final String currencyCode;
  final String iban;

  const CreditorAccountEntity({
    required this.currencyCode,
    required this.iban,
  });

  factory CreditorAccountEntity.fromJson(Map<String, dynamic> json) =>
      _$CreditorAccountEntityFromJson(json);

  CreditorAccount toModel() =>
      CreditorAccount(currencyCode: currencyCode, iban: iban);
}
