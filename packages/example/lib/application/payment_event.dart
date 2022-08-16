part of 'payment_bloc.dart';

@freezed
class PaymentEvent with _$PaymentEvent {
  const factory PaymentEvent.loadInitiated() = PaymentLoadInitiated;
  const factory PaymentEvent.paymentTypeSelected({
    required PaymentType paymentType,
  }) = PaymentTypeSelected;
  const factory PaymentEvent.countrySelected({
    required String countryCode,
  }) = PaymentCountrySelected;
  const factory PaymentEvent.creditorSelected({
    required Creditor creditor,
  }) = PaymentCreditorSelected;
  const factory PaymentEvent.emailUpdated({
    required String email,
  }) = EmailUpdated;
  const factory PaymentEvent.amountUpdated({
    required double amount,
  }) = AmountUpdated;
  const factory PaymentEvent.privacyAgreementUpdated({
    required bool isAccepted,
  }) = PrivacyAgreementUpdated;
  const factory PaymentEvent.initiateDonation() = InitiateDonation;
  const factory PaymentEvent.successPresented() = SuccessPresented;
}
