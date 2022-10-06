import 'package:equatable/equatable.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';
import 'package:kevin_flutter_in_app_payments/kevin_flutter_in_app_payments.dart';

class PaymentSession extends Equatable {
  final String paymentId;
  final KevinPaymentType paymentType;
  final bool skipAuthentication;
  final KevinCountry preselectedCountry;

  const PaymentSession({
    required this.paymentId,
    required this.paymentType,
    required this.skipAuthentication,
    required this.preselectedCountry,
  });

  @override
  List<Object?> get props => [
        paymentId,
        paymentType,
        skipAuthentication,
        preselectedCountry,
      ];
}
