import 'package:domain/country/model/country.dart';
import 'package:equatable/equatable.dart';
import 'package:kevin_flutter_example/payments/model/creditor_list_item.dart';
import 'package:kevin_flutter_example/payments/model/payment_session.dart';
import 'package:quiver/core.dart';

class PaymentsState extends Equatable {
  final Country country;

  final List<CreditorListItem> creditors;
  final bool creditorsLoading;

  final String email;
  final Optional<String> emailError;

  final String amount;
  final Optional<String> amountError;

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
    required this.emailError,
    required this.amount,
    required this.amountError,
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
    Optional<String>? emailError,
    String? amount,
    Optional<String>? amountError,
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
      emailError: emailError ?? this.emailError,
      amount: amount ?? this.amount,
      amountError: amountError ?? this.amountError,
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
    emailError,
    amount,
    amountError,
    userInputFieldsUpdated,
    termsAccepted,
    termsError,
    openPaymentTypeDialog,
    initializePaymentResult,
    initializePaymentLoading,
    generalError
  ];
}