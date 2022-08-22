part of 'payment_bloc.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState({
    required TextEditingController emailController,
    required TextEditingController amountController,
    required FocusNode emailFocusNode,
    required FocusNode amountFocusNode,
    @Default(KevinPaymentType.bank) KevinPaymentType selectedPaymentType,
    @Default([]) List<String> countryList,
    String? selectedCountryCode,
    @Default([]) List<Creditor> creditors,
    Creditor? selectedCreditor,
    @Default('') String email,
    @Default(0.0) double amount,
    @Default(false) bool isPrivacyPolicyAccepted,
    @Default(false) bool isCountryRequestInProgress,
    @Default(false) bool isCharityRequestInProgress,
    @Default(false) bool isPaymentRequestInProgress,
    @Default(false) bool showError,
    @Default(false) bool sdkSuccess,
    String? errorMessage,
  }) = _PaymentState;

  factory PaymentState.initial({
    required TextEditingController emailController,
    required TextEditingController amountController,
    required FocusNode emailFocusNode,
    required FocusNode amountFocusNode,
  }) =>
      PaymentState(
        emailController: emailController,
        amountController: amountController,
        emailFocusNode: emailFocusNode,
        amountFocusNode: amountFocusNode,
      );
}
