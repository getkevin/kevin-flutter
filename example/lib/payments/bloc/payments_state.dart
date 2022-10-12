import 'package:domain/country/model/country.dart';
import 'package:equatable/equatable.dart';
import 'package:kevin_flutter_example/payments/model/creditor_list_item.dart';
import 'package:kevin_flutter_example/payments/model/payment_session.dart';
import 'package:kevin_flutter_example/validation/model/validation_result.dart';
import 'package:quiver/core.dart';

class PaymentsState extends Equatable {
  final Country country;

  final List<CreditorListItem> creditors;
  final bool creditorsLoading;

  final String email;
  final Optional<ValidationResult> emailValidationResult;

  final String amount;
  final Optional<ValidationResult> amountValidationResult;

  final bool userInputFieldsUpdated;

  final bool termsAccepted;
  final bool termsError;

  final bool openPaymentTypeDialog;

  final Optional<PaymentSession> initializePaymentResult;
  final bool initializePaymentLoading;

  final Optional<Exception> generalError;

  const PaymentsState({
    required this.country,
    required this.creditors,
    required this.creditorsLoading,
    required this.email,
    required this.emailValidationResult,
    required this.amount,
    required this.amountValidationResult,
    required this.userInputFieldsUpdated,
    required this.termsAccepted,
    required this.termsError,
    required this.openPaymentTypeDialog,
    required this.initializePaymentResult,
    required this.initializePaymentLoading,
    required this.generalError,
  });

  PaymentsState copyWith({
    Country? country,
    List<CreditorListItem>? creditors,
    bool? creditorsLoading,
    String? email,
    Optional<ValidationResult>? emailValidationResult,
    String? amount,
    Optional<ValidationResult>? amountValidationResult,
    bool? userInputFieldsUpdated,
    bool? termsAccepted,
    bool? termsError,
    bool? openPaymentTypeDialog,
    Optional<PaymentSession>? initializePaymentResult,
    bool? initializePaymentLoading,
    Optional<Exception>? generalError,
  }) {
    return PaymentsState(
      country: country ?? this.country,
      creditors: creditors ?? this.creditors,
      creditorsLoading: creditorsLoading ?? this.creditorsLoading,
      email: email ?? this.email,
      emailValidationResult:
          emailValidationResult ?? this.emailValidationResult,
      amount: amount ?? this.amount,
      amountValidationResult:
          amountValidationResult ?? this.amountValidationResult,
      userInputFieldsUpdated:
          userInputFieldsUpdated ?? this.userInputFieldsUpdated,
      termsAccepted: termsAccepted ?? this.termsAccepted,
      termsError: termsError ?? this.termsError,
      openPaymentTypeDialog:
          openPaymentTypeDialog ?? this.openPaymentTypeDialog,
      initializePaymentResult:
          initializePaymentResult ?? this.initializePaymentResult,
      initializePaymentLoading:
          initializePaymentLoading ?? this.initializePaymentLoading,
      generalError: generalError ?? this.generalError,
    );
  }

  @override
  List<Object?> get props => [
        country,
        creditors,
        creditorsLoading,
        email,
        emailValidationResult,
        amount,
        amountValidationResult,
        userInputFieldsUpdated,
        termsAccepted,
        termsError,
        openPaymentTypeDialog,
        initializePaymentResult,
        initializePaymentLoading,
        generalError,
      ];
}
