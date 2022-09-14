import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kevin_flutter_example/domain/payment_initialization_state/payment_initialization_state.dart';

part 'payment_initialization_state_dto.freezed.dart';
part 'payment_initialization_state_dto.g.dart';

@freezed
class PaymentInitializationStateDTO with _$PaymentInitializationStateDTO {
  const PaymentInitializationStateDTO._();

  const factory PaymentInitializationStateDTO({
    required String id,
    String? bankStatus,
    String? cardStatus,
    required String statusGroup,
    required String confirmLink,
  }) = _PaymentInitializationStateDTO;

  factory PaymentInitializationStateDTO.fromDomain(
    PaymentInitializationState paymentState,
  ) {
    return PaymentInitializationStateDTO(
      id: paymentState.id,
      bankStatus: paymentState.bankStatus,
      cardStatus: paymentState.cardStatus,
      statusGroup: paymentState.statusGroup,
      confirmLink: paymentState.confirmLink,
    );
  }

  PaymentInitializationState toDomain() {
    return PaymentInitializationState(
      id: id,
      bankStatus: bankStatus,
      cardStatus: cardStatus,
      statusGroup: statusGroup,
      confirmLink: confirmLink,
    );
  }

  factory PaymentInitializationStateDTO.fromJson(Map<String, dynamic> json) =>
      _$PaymentInitializationStateDTOFromJson(json);
}
