import 'package:json_annotation/json_annotation.dart';
import 'package:kevin_flutter/kevin_flutter.dart';

part 'kevin_session_result_payment_success_entity.g.dart';

@JsonSerializable(createToJson: false, createFactory: true)
class KevinSessionResultPaymentSuccessEntity {
  final String paymentId;

  const KevinSessionResultPaymentSuccessEntity({
    required this.paymentId,
  });

  factory KevinSessionResultPaymentSuccessEntity.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$KevinSessionResultPaymentSuccessEntityFromJson(json);

  KevinSessionResultPaymentSuccess toModel() =>
      KevinSessionResultPaymentSuccess(paymentId: paymentId);
}
