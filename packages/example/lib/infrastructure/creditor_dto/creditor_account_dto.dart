import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kevin_flutter_example/domain/creditor/creditor_account.dart';

part 'creditor_account_dto.freezed.dart';

part 'creditor_account_dto.g.dart';

@freezed
class CreditorAccountDTO with _$CreditorAccountDTO {
  const CreditorAccountDTO._();

  const factory CreditorAccountDTO({
    required String currencyCode,
    required String iban,
  }) = _CreditorAccountDTO;

  factory CreditorAccountDTO.fromDomain(CreditorAccount creditorAccount) {
    return CreditorAccountDTO(
      currencyCode: creditorAccount.currencyCode,
      iban: creditorAccount.iban,
    );
  }

  CreditorAccount toDomain() {
    return CreditorAccount(
      currencyCode: currencyCode,
      iban: iban,
    );
  }

  factory CreditorAccountDTO.fromJson(Map<String, dynamic> json) =>
      _$CreditorAccountDTOFromJson(json);
}
