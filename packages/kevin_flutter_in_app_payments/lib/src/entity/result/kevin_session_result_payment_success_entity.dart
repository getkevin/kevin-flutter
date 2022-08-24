import 'package:json_annotation/json_annotation.dart';
import 'package:kevin_flutter_in_app_payments/src/model/kevin_session_result_payment_success.dart';

part 'kevin_session_result_payment_success_entity.g.dart';

@JsonSerializable(createToJson: true, createFactory: true)
class KevinSessionResultPaymentSuccessEntity {
  final String paymentId;

  const KevinSessionResultPaymentSuccessEntity({
    required this.paymentId,
  });

  factory KevinSessionResultPaymentSuccessEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$KevinSessionResultPaymentSuccessEntityFromJson(json);

  Map<String, dynamic> toJson() =>
      _$KevinSessionResultPaymentSuccessEntityToJson(this);

  KevinSessionResultPaymentSuccess toModel() =>
      KevinSessionResultPaymentSuccess(paymentId: paymentId);
}
