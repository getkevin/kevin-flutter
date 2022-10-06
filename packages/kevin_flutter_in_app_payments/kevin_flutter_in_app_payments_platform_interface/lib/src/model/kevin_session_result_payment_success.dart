import 'package:kevin_flutter_core/kevin_flutter_core.dart';

class KevinSessionResultPaymentSuccess extends KevinSessionResult {
  final String paymentId;

  const KevinSessionResultPaymentSuccess({
    required this.paymentId,
  });

  Map<String, dynamic> toMap() {
    return {
      'paymentId': paymentId,
    };
  }

  factory KevinSessionResultPaymentSuccess.fromMap(Map<String, dynamic> map) {
    return KevinSessionResultPaymentSuccess(
      paymentId: map['paymentId'] as String,
    );
  }
}
