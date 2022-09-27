import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:collection/collection.dart';
import 'package:domain/country/model/country.dart';
import 'package:domain/payments/usecase/get_creditors_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevin_flutter_example/payments/model/creditor_list_item.dart';
import 'package:kevin_flutter_example/theme/app_images.dart';
import 'package:kevin_flutter_example/validation/amount_validator.dart';
import 'package:kevin_flutter_example/validation/email_validator.dart';
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
  final Country country;

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
    Country? country,
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

const _defaultCountry = Country(
  code: 'LT',
  flag: AppImages.flagLt,
  name: 'Lithuania',
);

/// BLoC
class PaymentsBloc extends Bloc<PaymentsEvent, PaymentsState> {
  final GetCreditorsUseCase _getCreditorsUseCase;
  final EmailValidator _emailValidator;
  final AmountValidator _amountValidator;

  PaymentsBloc({
    required GetCreditorsUseCase getCreditorsUseCase,
    required EmailValidator emailValidator,
    required AmountValidator amountValidator,
  })  : _getCreditorsUseCase = getCreditorsUseCase,
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
    on<PaymentsEvent>(
      (event, emitter) async {
        if (event is InitialLoadEvent) {
          await _onInitialLoadEvent(event, emitter);
        } else if (event is SetCountryEvent) {
          await _onSetCountryEvent(event, emitter);
        } else if (event is SetCreditorEvent) {
          await _onSetCreditorEvent(event, emitter);
        } else if (event is SetEmailEvent) {
          await _onSetEmailEvent(event, emitter);
        } else if (event is SetAmountEvent) {
          await _onSetAmountEvent(event, emitter);
        } else if (event is SetTermsAcceptedEvent) {
          await _onSetTermsAcceptedEvent(event, emitter);
        } else if (event is ValidatePaymentEvent) {
          await _onValidatePaymentEvent(event, emitter);
        } else if (event is SubmitPaymentEvent) {
          await _onSubmitPaymentEvent(event, emitter);
        } else if (event is ClearOpenPaymentTypeDialogEvent) {
          await _onClearOpenPaymentTypeDialogEvent(event, emitter);
        } else if (event is ClearGeneralErrorEvent) {
          await _onClearGeneralErrorEvent(event, emitter);
        }
      },
      transformer: sequential(),
    );
  }

  Future<void> _onInitialLoadEvent(
    InitialLoadEvent event,
    Emitter<PaymentsState> emitter,
  ) async {
    emitter(state.copyWith(creditorsLoading: true));
    emitter(await _loadCreditors(state: state, countryCode: 'LT'));
  }

  Future<void> _onSetCountryEvent(
    SetCountryEvent event,
    Emitter<PaymentsState> emitter,
  ) async {
    emitter(state.copyWith(country: event.country, creditorsLoading: true));
    emitter(
      await _loadCreditors(state: state, countryCode: event.country.code),
    );
  }

  Future<void> _onSetCreditorEvent(
    SetCreditorEvent event,
    Emitter<PaymentsState> emitter,
  ) async {
    final creditors = state.creditors
        .map((c) => c.copyWith(selected: c.iban == event.creditor.iban))
        .toList();

    emitter(state.copyWith(creditors: creditors));
  }

  Future<void> _onSetEmailEvent(
    SetEmailEvent event,
    Emitter<PaymentsState> emitter,
  ) async {
    if (event.email == state.email) return;

    emitter(
      state.copyWith(
        email: event.email,
        emailError: const Optional.absent(),
      ),
    );
  }

  Future<void> _onSetAmountEvent(
    SetAmountEvent event,
    Emitter<PaymentsState> emitter,
  ) async {
    if (event.amount == state.amount) return;

    emitter(
      state.copyWith(
        amount: event.amount.replaceFirst(',', '.'),
        amountError: const Optional.absent(),
      ),
    );
  }

  Future<void> _onSetTermsAcceptedEvent(
    SetTermsAcceptedEvent event,
    Emitter<PaymentsState> emitter,
  ) async {
    emitter(
      state.copyWith(
        termsAccepted: event.accepted,
        termsError: false,
      ),
    );
  }

  Future<void> _onValidatePaymentEvent(
    ValidatePaymentEvent event,
    Emitter<PaymentsState> emitter,
  ) async {
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

  Future<void> _onSubmitPaymentEvent(
    SubmitPaymentEvent event,
    Emitter<PaymentsState> emitter,
  ) async {}

  Future<void> _onClearOpenPaymentTypeDialogEvent(
    ClearOpenPaymentTypeDialogEvent event,
    Emitter<PaymentsState> emitter,
  ) async {
    emitter(
      state.copyWith(openPaymentTypeDialog: false),
    );
  }

  Future<void> _onClearGeneralErrorEvent(
    ClearGeneralErrorEvent event,
    Emitter<PaymentsState> emitter,
  ) async {
    emitter(state.copyWith(generalError: const Optional.absent()));
  }

  Future<PaymentsState> _loadCreditors({
    required PaymentsState state,
    required String countryCode,
  }) async {
    try {
      final creditors = await _getCreditorsUseCase.invoke(countryCode);
      final creditorItems = creditors
          .mapIndexed(
            (index, c) => CreditorListItem(
              logo: c.logo,
              name: c.name,
              iban: c.accounts.firstOrNull?.iban ?? '',
              selected: index == 0,
            ),
          )
          .toList();
      return state.copyWith(
        creditors: creditorItems,
        creditorsLoading: false,
      );
    } on Exception catch (error, st) {
      Fimber.e('Error on payments initial load', ex: error, stacktrace: st);
      return state.copyWith(
        generalError: Optional.of(error),
        creditors: [],
        creditorsLoading: false,
      );
    }
  }
}
