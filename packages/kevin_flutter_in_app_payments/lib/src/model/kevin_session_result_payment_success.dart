import 'package:kevin_flutter_core/kevin_flutter_core.dart';

class KevinSessionResultPaymentSuccess extends KevinSessionResult {
  final String paymentId;

  const KevinSessionResultPaymentSuccess({
    required this.paymentId,
  });
}
