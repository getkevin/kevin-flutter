import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kevin_flutter_example/domain/creditor/creditor.dart';
import 'package:kevin_flutter_example/infrastructure/creditor_dto/creditor_account_dto.dart';

part 'creditor_dto.freezed.dart';

part 'creditor_dto.g.dart';

@freezed
class CreditorDTO with _$CreditorDTO {
  const CreditorDTO._();

  const factory CreditorDTO({
    required String id,
    required String name,
    required List<CreditorAccountDTO> accounts,
    required String logo,
    required String informationUnstructured,
    required String country,
    required String website,
    required String phone,
    required String email,
    required String address,
  }) = _CreditorDTO;

  factory CreditorDTO.fromDomain(Creditor creditor) {
    return CreditorDTO(
      id: creditor.id,
      name: creditor.name,
      accounts: creditor.accounts
          .map((a) => CreditorAccountDTO.fromDomain(a))
          .toList(),
      logo: creditor.logo,
      informationUnstructured: creditor.informationUnstructured,
      country: creditor.country,
      website: creditor.website,
      phone: creditor.phone,
      email: creditor.email,
      address: creditor.address,
    );
  }

  Creditor toDomain() {
    return Creditor(
      id: id,
      name: name,
      accounts: accounts.map((a) => a.toDomain()).toList(),
      logo: logo,
      informationUnstructured: informationUnstructured,
      country: country,
      website: website,
      phone: phone,
      email: email,
      address: address,
    );
  }

  factory CreditorDTO.fromJson(Map<String, dynamic> json) =>
      _$CreditorDTOFromJson(json);
}
