import 'package:kevin_flutter_in_app_payments_platform_interface/src/model/kevin_session_result_payment_success.dart';

part 'kevin_session_result_payment_success_entity_json.dart';

class KevinSessionResultPaymentSuccessEntity {
  final String paymentId;

  const KevinSessionResultPaymentSuccessEntity({
    required this.paymentId,
  });

  factory KevinSessionResultPaymentSuccessEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      _toJson(json);

  Map<String, dynamic> toJson() =>
      _$KevinSessionResultPaymentSuccessEntityToJson(this);

  KevinSessionResultPaymentSuccess toModel() =>
      KevinSessionResultPaymentSuccess(paymentId: paymentId);
}
