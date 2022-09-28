import 'package:domain/kevin/model/payment_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_request_entity.g.dart';

@JsonSerializable(createFactory: false)
class PaymentRequestEntity {
  final String amount;
  final String email;
  final String creditorName;
  final String redirectUrl;
  final String? iban;

  const PaymentRequestEntity({
    required this.amount,
    required this.email,
    required this.creditorName,
    required this.redirectUrl,
    this.iban,
  });

  Map<String, dynamic> toJson() => _$PaymentRequestEntityToJson(this);

  factory PaymentRequestEntity.fromModel(PaymentRequest request) =>
      PaymentRequestEntity(
        amount: request.amount,
        email: request.email,
        creditorName: request.creditorName,
        redirectUrl: request.redirectUrl,
        iban: request.iban,
      );
}
