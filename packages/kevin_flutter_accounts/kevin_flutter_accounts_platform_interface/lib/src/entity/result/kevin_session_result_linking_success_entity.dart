import 'package:kevin_flutter_accounts_platform_interface/src/entity/kevin_bank_entity.dart';
import 'package:kevin_flutter_accounts_platform_interface/src/model/account/kevin_account_linking_type.dart';
import 'package:kevin_flutter_accounts_platform_interface/src/model/kevin_session_result_account_success.dart';

part 'kevin_session_result_linking_success_entity_json.dart';

class KevinSessionResultLinkingSuccessEntity {
  final KevinBankEntity? bank;
  final String authorizationCode;
  final String linkingType;

  const KevinSessionResultLinkingSuccessEntity({
    required this.bank,
    required this.authorizationCode,
    required this.linkingType,
  });

  factory KevinSessionResultLinkingSuccessEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$KevinSessionResultLinkingSuccessEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$KevinSessionResultLinkingSuccessEntityToJson(this);

  KevinSessionResultLinkingSuccess toModel() =>
      KevinSessionResultLinkingSuccess(
        bank: bank?.toModel(),
        authorizationCode: authorizationCode,
        linkingType: _getLinkingType(),
      );

  KevinAccountLinkingType _getLinkingType() =>
      KevinAccountLinkingType.getByName(linkingType.toLowerCase()) ??
      KevinAccountLinkingType.bank;
}
