import 'package:equatable/equatable.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';

class PaymentSession extends Equatable {
  final String paymentId;
  final bool skipAuthentication;
  final KevinCountry preselectedCountry;

  const PaymentSession({
    required this.paymentId,
    required this.skipAuthentication,
    required this.preselectedCountry,
  });

  @override
  List<Object?> get props => [
        paymentId,
        skipAuthentication,
        preselectedCountry,
      ];
}
