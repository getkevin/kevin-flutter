import 'package:equatable/equatable.dart';

class PaymentRequest extends Equatable {
  final String amount;
  final String email;
  final String creditorName;
  final String redirectUrl;
  final String? iban;

  const PaymentRequest({
    required this.amount,
    required this.email,
    required this.creditorName,
    required this.redirectUrl,
    this.iban,
  });

  @override
  List<Object?> get props => [
        amount,
        email,
        creditorName,
        redirectUrl,
        iban,
      ];
}
