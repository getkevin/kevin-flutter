import 'package:json_annotation/json_annotation.dart';
import 'package:kevin_flutter/kevin_flutter.dart';
import 'package:kevin_flutter/src/entity/kevin_bank_entity.dart';

part 'kevin_session_result_linking_success_entity.g.dart';

@JsonSerializable(createToJson: false, createFactory: true)
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
