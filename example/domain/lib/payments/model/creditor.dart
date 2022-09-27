import 'package:domain/payments/model/creditor_account.dart';
import 'package:equatable/equatable.dart';

class Creditor extends Equatable {
  final String logo;
  final String name;
  final List<CreditorAccount> accounts;

  const Creditor({
    required this.logo,
    required this.name,
    required this.accounts,
  });

  @override
  List<Object?> get props => [logo, name, accounts];
}
