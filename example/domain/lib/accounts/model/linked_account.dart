import 'package:equatable/equatable.dart';

class LinkedAccount extends Equatable {
  final int id;
  final String bankName;
  final String logoUrl;
  final String linkToken;
  final String bankId;

  const LinkedAccount({
    required this.id,
    required this.bankName,
    required this.logoUrl,
    required this.linkToken,
    required this.bankId,
  });

  LinkedAccount copyWith({
    int? id,
    String? bankName,
    String? logoUrl,
    String? linkToken,
    String? bankId,
  }) {
    return LinkedAccount(
      id: id ?? this.id,
      bankName: bankName ?? this.bankName,
      logoUrl: logoUrl ?? this.logoUrl,
      linkToken: linkToken ?? this.linkToken,
      bankId: bankId ?? this.bankId,
    );
  }

  @override
  List<Object?> get props => [
        id,
        bankName,
        logoUrl,
        linkToken,
        bankId,
      ];
}
