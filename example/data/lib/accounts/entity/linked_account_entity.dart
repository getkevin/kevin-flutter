import 'package:domain/accounts/model/linked_account.dart';
import 'package:hive/hive.dart';

part 'linked_account_entity.g.dart';

@HiveType(typeId: 0)
class LinkedAccountEntity extends HiveObject {
  @HiveField(0)
  final String bankName;
  @HiveField(1)
  final String logoUrl;
  @HiveField(2)
  final String linkToken;
  @HiveField(3)
  final String bankId;

  LinkedAccountEntity({
    required this.bankName,
    required this.logoUrl,
    required this.linkToken,
    required this.bankId,
  });

  factory LinkedAccountEntity.fromModel(LinkedAccount model) =>
      LinkedAccountEntity(
        bankName: model.bankName,
        logoUrl: model.logoUrl,
        linkToken: model.linkToken,
        bankId: model.bankId,
      );

  LinkedAccount toModel({required int id}) => LinkedAccount(
        id: id,
        bankName: bankName,
        logoUrl: logoUrl,
        linkToken: linkToken,
        bankId: bankId,
      );
}
