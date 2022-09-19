import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_initialization_state.freezed.dart';

@freezed
class PaymentInitializationState with _$PaymentInitializationState {
  const PaymentInitializationState._();

  const factory PaymentInitializationState({
    required String id,
    String? bankStatus,
    String? cardStatus,
    required String statusGroup,
    required String confirmLink,
  }) = _PaymentInitializationState;
}
