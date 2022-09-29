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

  @override
  List<Object?> get props => [
        id,
        bankName,
        logoUrl,
        linkToken,
        bankId,
      ];
}
