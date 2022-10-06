import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevin_flutter_example/country/country_helper.dart';
import 'package:kevin_flutter_example/payments/model/country_item.dart';
import 'package:kevin_flutter_example/payments/model/creditor_list_item.dart';
import 'package:kevin_flutter_example/validation/email_validator.dart';
import 'package:kevin_flutter_example/validation/amount_validator.dart';
import 'package:quiver/core.dart';

/// Events
abstract class PaymentsEvent extends Equatable {
  const PaymentsEvent();

  @override
  List<Object?> get props => [];
}

class InitialLoadEvent extends PaymentsEvent {
  const InitialLoadEvent();
}

class SetCountryEvent extends PaymentsEvent {
  final String countryCode;

  const SetCountryEvent({required this.countryCode});

  @override
  List<Object?> get props => [countryCode];
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

class SubmitPaymentEvent extends PaymentsEvent {
  const SubmitPaymentEvent();
}

class ClearOpenPaymentTypeDialogEvent extends PaymentsEvent {
  const ClearOpenPaymentTypeDialogEvent();
}

class ClearGeneralErrorEvent extends PaymentsEvent {
  const ClearGeneralErrorEvent();
}

/// State
class PaymentsState extends Equatable {
  final CountryItem country;

  final List<CreditorListItem> creditors;
  final bool creditorsLoading;

  final String email;
  final Optional<String> emailError;

  final String amount;
  final Optional<String> amountError;

  final bool termsAccepted;
  final bool termsError;

  final bool openPaymentTypeDialog;

  final Optional<Exception> generalError;

  const PaymentsState({
    required this.country,
    required this.creditors,
    required this.creditorsLoading,
    required this.email,
    required this.emailError,
    required this.amount,
    required this.amountError,
    required this.termsAccepted,
    required this.termsError,
    required this.openPaymentTypeDialog,
    required this.generalError,
  });

  PaymentsState copyWith({
    CountryItem? country,
    List<CreditorListItem>? creditors,
    bool? creditorsLoading,
    String? email,
    Optional<String>? emailError,
    String? amount,
    Optional<String>? amountError,
    bool? termsAccepted,
    bool? termsError,
    bool? openPaymentTypeDialog,
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
      termsAccepted: termsAccepted ?? this.termsAccepted,
      termsError: termsError ?? this.termsError,
      openPaymentTypeDialog:
          openPaymentTypeDialog ?? this.openPaymentTypeDialog,
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
        termsAccepted,
        termsError,
        openPaymentTypeDialog,
        generalError
      ];
}

const _defaultCountry = CountryItem(
  code: 'LT',
  flag: 'resources/flags/flag_lt.svg',
  name: 'Lithuania',
);

/// BLoC
class PaymentsBloc extends Bloc<PaymentsEvent, PaymentsState> {
  final CountryHelper _countryHelper;
  final EmailValidator _emailValidator;
  final AmountValidator _amountValidator;

  PaymentsBloc({
    required CountryHelper countryHelper,
    required EmailValidator emailValidator,
    required AmountValidator amountValidator,
  })  : _countryHelper = countryHelper,
        _emailValidator = emailValidator,
        _amountValidator = amountValidator,
        super(
          const PaymentsState(
            country: _defaultCountry,
            creditors: [],
            creditorsLoading: false,
            email: '',
            emailError: Optional.absent(),
            amount: '',
            amountError: Optional.absent(),
            termsAccepted: false,
            termsError: false,
            openPaymentTypeDialog: false,
            generalError: Optional.absent(),
          ),
        ) {
    on<InitialLoadEvent>(_onInitialLoadEvent);
    on<SetCountryEvent>(_onSetCountryEvent);
    on<SetCreditorEvent>(_onSetCreditorEvent);
    on<SetEmailEvent>(_onSetEmailEvent);
    on<SetAmountEvent>(_onSetAmountEvent);
    on<SetTermsAcceptedEvent>(_onSetTermsAcceptedEvent);
    on<ValidatePaymentEvent>(_onValidatePaymentEvent);
    on<SubmitPaymentEvent>(_onSubmitPaymentEvent);
    on<ClearOpenPaymentTypeDialogEvent>(_onClearOpenPaymentTypeDialogEvent);
    on<ClearGeneralErrorEvent>(_onClearGeneralErrorEvent);
  }

  void _onInitialLoadEvent(
    InitialLoadEvent event,
    Emitter<PaymentsState> emitter,
  ) async {
    emitter(state.copyWith(creditorsLoading: true));

    const testCreditor = CreditorListItem(
      logo: 'https://themesfinity.com/wp-content/uploads/2018/02/default-placeholder.png',
      name: 'name',
      iban: 'iban',
      selected: false,
    );

    final creditors = [
      testCreditor.copyWith(selected: true),
      testCreditor.copyWith(name: 'name1', iban: 'iban1'),
      testCreditor.copyWith(name: 'name2', iban: 'iban2'),
    ];

    // TODO: Remove after testing
    await Future.delayed(const Duration(milliseconds: 500));

    emitter(
      state.copyWith(
        creditors: creditors,
        creditorsLoading: false,
      ),
    );
  }

  void _onSetCountryEvent(
    SetCountryEvent event,
    Emitter<PaymentsState> emitter,
  ) async {
    final country = CountryItem(
      code: event.countryCode,
      flag: await _countryHelper.getFlag(event.countryCode),
      name: _countryHelper.getName(event.countryCode),
    );

    emitter(state.copyWith(country: country, creditorsLoading: true));

    const testCreditor = CreditorListItem(
      logo: 'https://themesfinity.com/wp-content/uploads/2018/02/default-placeholder.png',
      name: 'name',
      iban: 'iban',
      selected: false,
    );

    final creditors = [
      testCreditor.copyWith(selected: true),
      testCreditor.copyWith(name: 'name1', iban: 'iban1'),
      testCreditor.copyWith(name: 'name2', iban: 'iban2'),
    ];

    // TODO: Remove after testing
    await Future.delayed(const Duration(milliseconds: 500));

    emitter(
      state.copyWith(
        creditors: creditors,
        creditorsLoading: false,
      ),
    );
  }

  void _onSetCreditorEvent(
    SetCreditorEvent event,
    Emitter<PaymentsState> emitter,
  ) {
    final creditors = state.creditors
        .map((c) => c.copyWith(selected: c.iban == event.creditor.iban))
        .toList();

    emitter(state.copyWith(creditors: creditors));
  }

  void _onSetEmailEvent(SetEmailEvent event, Emitter<PaymentsState> emitter) {
    if (event.email == state.email) return;

    emitter(
      state.copyWith(
        email: event.email,
        emailError: const Optional.absent(),
      ),
    );
  }

  void _onSetAmountEvent(SetAmountEvent event, Emitter<PaymentsState> emitter) {
    if (event.amount == state.amount) return;

    emitter(
      state.copyWith(
        amount: event.amount.replaceFirst(',', '.'),
        amountError: const Optional.absent(),
      ),
    );
  }

  void _onSetTermsAcceptedEvent(
    SetTermsAcceptedEvent event,
    Emitter<PaymentsState> emitter,
  ) {
    emitter(
      state.copyWith(
        termsAccepted: event.accepted,
        termsError: false,
      ),
    );
  }

  void _onValidatePaymentEvent(
    ValidatePaymentEvent event,
    Emitter<PaymentsState> emitter,
  ) {
    final emailValidationResult = _emailValidator.validate(state.email.trim());
    final amountValidationResult =
        _amountValidator.validate(state.amount.trim());

    if (!emailValidationResult.isValid ||
        !amountValidationResult.isValid ||
        !state.termsAccepted) {
      emitter(
        state.copyWith(
          emailError: Optional.fromNullable(emailValidationResult.message),
          amountError: Optional.fromNullable(amountValidationResult.message),
          termsError: !state.termsAccepted,
        ),
      );
    } else {
      emitter(
        state.copyWith(
          openPaymentTypeDialog: true,
        ),
      );
    }
  }

  void _onSubmitPaymentEvent(
    SubmitPaymentEvent event,
    Emitter<PaymentsState> emitter,
  ) {}

  void _onClearOpenPaymentTypeDialogEvent(
    ClearOpenPaymentTypeDialogEvent event,
    Emitter<PaymentsState> emitter,
  ) {
    emitter(
      state.copyWith(openPaymentTypeDialog: false),
    );
  }

  void _onClearGeneralErrorEvent(
    ClearGeneralErrorEvent event,
    Emitter<PaymentsState> emitter,
  ) {
    emitter(state.copyWith(generalError: const Optional.absent()));
  }
}
