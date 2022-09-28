import 'package:domain/kevin/model/payment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_entity.g.dart';

@JsonSerializable(createToJson: false)
class PaymentEntity {
  final String id;

  const PaymentEntity({
    required this.id,
  });

  factory PaymentEntity.fromJson(Map<String, dynamic> json) =>
      _$PaymentEntityFromJson(json);

  Payment toModel() => Payment(id: id);
}
