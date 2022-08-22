import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kevin_flutter_example/domain/creditor/creditor_account.dart';

part 'creditor.freezed.dart';

@freezed
class Creditor with _$Creditor {
  const Creditor._();

  const factory Creditor({
    required String id,
    required String name,
    required List<CreditorAccount> accounts,
    required String logo,
    required String informationUnstructured,
    required String country,
    required String website,
    required String phone,
    required String email,
    required String address,
  }) = _Creditor;
}
