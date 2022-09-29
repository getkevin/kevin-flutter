import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:collection/collection.dart';
import 'package:domain/country/model/country.dart';
import 'package:domain/kevin/model/payment.dart';
import 'package:domain/kevin/model/payment_request.dart';
import 'package:domain/kevin/repository/kevin_repository.dart';
import 'package:domain/payments/usecase/get_creditors_use_case.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';
import 'package:kevin_flutter_example/country/country_extensions.dart';
import 'package:kevin_flutter_example/payments/bloc/payments_event.dart';
import 'package:kevin_flutter_example/payments/bloc/payments_state.dart';
import 'package:kevin_flutter_example/payments/model/creditor_list_item.dart';
import 'package:kevin_flutter_example/payments/model/payment_session.dart';
import 'package:kevin_flutter_example/payments/payment_type/model/payment_type.dart';
import 'package:kevin_flutter_example/theme/app_images.dart';
import 'package:kevin_flutter_example/validation/amount_validator.dart';
import 'package:kevin_flutter_example/validation/email_validator.dart';
import 'package:quiver/core.dart';

const _defaultCountry = Country(
  code: 'LT',
  flag: AppImages.flagLt,
  name: 'Lithuania',
);

class PaymentsBloc extends Bloc<PaymentsEvent, PaymentsState> {
  final KevinRepository _kevinRepository;
  final GetCreditorsUseCase _getCreditorsUseCase;
  final EmailValidator _emailValidator;
  final AmountValidator _amountValidator;

  PaymentsBloc({
    required KevinRepository kevinRepository,
    required GetCreditorsUseCase getCreditorsUseCase,
    required EmailValidator emailValidator,
    required AmountValidator amountValidator,
  })  : _kevinRepository = kevinRepository,
        _getCreditorsUseCase = getCreditorsUseCase,
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
            userInputFieldsUpdated: false,
            termsAccepted: false,
            termsError: false,
            openPaymentTypeDialog: false,
            initializePaymentResult: Optional.absent(),
            initializePaymentLoading: false,
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
        } else if (event is InitializeSinglePaymentEvent) {
          await _onInitializeSinglePaymentEvent(event, emitter);
        } else if (event is ClearOpenPaymentTypeDialogEvent) {
          await _onClearOpenPaymentTypeDialogEvent(event, emitter);
        } else if (event is ClearGeneralErrorEvent) {
          await _onClearGeneralErrorEvent(event, emitter);
        } else if (event is ClearInitializePaymentResultEvent) {
          await _onClearInitializePaymentResultEvent(event, emitter);
        } else if (event is ClearUserInputFieldsEvent) {
          await _onClearUserInputFieldsEvent(event, emitter);
        } else if (event is ClearUserInputFieldsUpdatedEvent) {
          await _onClearUserInputFieldsUpdatedEvent(event, emitter);
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

  Future<void> _onInitializeSinglePaymentEvent(
    InitializeSinglePaymentEvent event,
    Emitter<PaymentsState> emitter,
  ) async {
    emitter(state.copyWith(initializePaymentLoading: true));

    try {
      final Payment payment;

      final paymentRequest =
          _getPaymentRequest(state: state, redirectUrl: event.callbackUrl);

      if (event.paymentType == PaymentType.card) {
        payment = await _kevinRepository.initializeCardPayment(paymentRequest);
      } else {
        payment = await _kevinRepository.initializeBankPayment(paymentRequest);
      }

      final paymentSession = PaymentSession(
        paymentId: payment.id,
        paymentType: event.paymentType.toKevinPaymentType,
        skipAuthentication: false,
        preselectedCountry: state.country.toKevinCountry(
          defaultCountry: KevinCountry.lithuania,
        ),
      );

      emitter(
        state.copyWith(
          initializePaymentResult: Optional.of(paymentSession),
          initializePaymentLoading: false,
        ),
      );
    } on Exception catch (error, st) {
      Fimber.e('Error initializing payment', ex: error, stacktrace: st);
      emitter(
        state.copyWith(
          generalError: Optional.of(error),
          initializePaymentLoading: false,
        ),
      );
    }
  }

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

  Future<void> _onClearInitializePaymentResultEvent(
    ClearInitializePaymentResultEvent event,
    Emitter<PaymentsState> emitter,
  ) async {
    emitter(state.copyWith(initializePaymentResult: const Optional.absent()));
  }

  Future<void> _onClearUserInputFieldsEvent(
    ClearUserInputFieldsEvent event,
    Emitter<PaymentsState> emitter,
  ) async {
    emitter(
      state.copyWith(
        email: '',
        amount: '',
        termsAccepted: false,
        userInputFieldsUpdated: true,
      ),
    );
  }

  Future<void> _onClearUserInputFieldsUpdatedEvent(
    ClearUserInputFieldsUpdatedEvent event,
    Emitter<PaymentsState> emitter,
  ) async {
    emitter(state.copyWith(userInputFieldsUpdated: false));
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

  static PaymentRequest _getPaymentRequest({
    required PaymentsState state,
    required String redirectUrl,
  }) {
    final creditor = state.creditors.firstWhere((c) => c.selected);
    return PaymentRequest(
      amount: state.amount.trim(),
      email: state.email.trim(),
      creditorName: creditor.name,
      redirectUrl: redirectUrl,
      // TODO: Use correct creditor iban when BE issue is resolved
      iban: null,
    );
  }
}
