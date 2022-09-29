import 'package:domain/country/model/country.dart';
import 'package:equatable/equatable.dart';
import 'package:kevin_flutter_example/payments/model/creditor_list_item.dart';
import 'package:kevin_flutter_example/payments/payment_type/model/payment_type.dart';

abstract class PaymentsEvent extends Equatable {
  const PaymentsEvent();

  @override
  List<Object?> get props => [];
}

class InitialLoadEvent extends PaymentsEvent {
  const InitialLoadEvent();
}

class SetCountryEvent extends PaymentsEvent {
  final Country country;

  const SetCountryEvent({required this.country});

  @override
  List<Object?> get props => [country];
}

class SetCreditorEvent extends PaymentsEvent {
  final CreditorListItem creditor;

  const SetCreditorEvent({
    required this.creditor,
  });

  @override
  List<Object?> get props => [creditor];
}

class SetEmailEvent extends PaymentsEvent {
  final String email;

  const SetEmailEvent({
    required this.email,
  });

  @override
  List<Object?> get props => [email];
}

class SetAmountEvent extends PaymentsEvent {
  final String amount;

  const SetAmountEvent({
    required this.amount,
  });

  @override
  List<Object?> get props => [amount];
}

class SetTermsAcceptedEvent extends PaymentsEvent {
  final bool accepted;

  const SetTermsAcceptedEvent({
    required this.accepted,
  });

  @override
  List<Object?> get props => [accepted];
}

class ValidatePaymentEvent extends PaymentsEvent {
  const ValidatePaymentEvent();
}

class InitializeSinglePaymentEvent extends PaymentsEvent {
  final PaymentType paymentType;
  final String callbackUrl;

  const InitializeSinglePaymentEvent({
    required this.paymentType,
    required this.callbackUrl,
  });

  @override
  List<Object?> get props => [
    paymentType,
    callbackUrl,
  ];
}

class ClearOpenPaymentTypeDialogEvent extends PaymentsEvent {
  const ClearOpenPaymentTypeDialogEvent();
}

class ClearGeneralErrorEvent extends PaymentsEvent {
  const ClearGeneralErrorEvent();
}

class ClearInitializePaymentResultEvent extends PaymentsEvent {
  const ClearInitializePaymentResultEvent();
}

class ClearUserInputFieldsEvent extends PaymentsEvent {
  const ClearUserInputFieldsEvent();
}

class ClearUserInputFieldsUpdatedEvent extends PaymentsEvent {
  const ClearUserInputFieldsUpdatedEvent();
}