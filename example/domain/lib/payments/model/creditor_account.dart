import 'package:equatable/equatable.dart';

class CreditorAccount extends Equatable {
  final String currencyCode;
  final String iban;

  const CreditorAccount({
    required this.currencyCode,
    required this.iban,
  });

  @override
  List<Object?> get props => [currencyCode, iban];
}