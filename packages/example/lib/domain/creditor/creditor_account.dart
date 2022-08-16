import 'package:freezed_annotation/freezed_annotation.dart';

part 'creditor_account.freezed.dart';

@freezed
class CreditorAccount with _$CreditorAccount {
  const CreditorAccount._();

  const factory CreditorAccount({
    required String currencyCode,
    required String iban,
  }) = _CreditorAccount;
}
