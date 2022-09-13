part of 'kevin_session_result_payment_success_entity.dart';

KevinSessionResultPaymentSuccessEntity _toJson(
  Map<String, dynamic> json,
) =>
    KevinSessionResultPaymentSuccessEntity(
      paymentId: json['paymentId'] as String,
    );

Map<String, dynamic> _$KevinSessionResultPaymentSuccessEntityToJson(
  KevinSessionResultPaymentSuccessEntity instance,
) =>
    <String, dynamic>{
      'paymentId': instance.paymentId,
    };
