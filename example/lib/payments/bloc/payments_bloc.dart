import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:collection/collection.dart';
import 'package:domain/country/model/country.dart';
import 'package:domain/kevin/model/payment.dart';
import 'package:domain/kevin/model/payment_request.dart';
import 'package:domain/payments/model/payment_type.dart';
import 'package:domain/payments/usecase/get_creditors_use_case.dart';
import 'package:domain/payments/usecase/initialize_linked_payment_use_case.dart';
import 'package:domain/payments/usecase/initialize_single_payment_use_case.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';
import 'package:kevin_flutter_example/country/country_extensions.dart';
import 'package:kevin_flutter_example/generated/locale_keys.g.dart';
import 'package:kevin_flutter_example/payments/bloc/payments_event.dart';
import 'package:kevin_flutter_example/payments/bloc/payments_state.dart';
import 'package:kevin_flutter_example/payments/model/creditor_list_item.dart';
import 'package:kevin_flutter_example/payments/model/payment_session.dart';
import 'package:kevin_flutter_example/theme/app_images.dart';
import 'package:kevin_flutter_example/validation/amount_validator.dart';
import 'package:kevin_flutter_example/validation/email_validator.dart';
import 'package:quiver/core.dart';

const _defaultCountry = Country(
  code: 'LT',
  flagKey: AppImages.flagLt,
  nameKey: LocaleKeys.country_lt,
);

class PaymentsBloc extends Bloc<PaymentsEvent, PaymentsState> {
  final InitializeSinglePaymentUseCase _initializeSinglePaymentUseCase;
  final InitializeLinkedPaymentUseCase _initializeLinkedPaymentUseCase;
  final GetCreditorsUseCase _getCreditorsUseCase;
  final EmailValidator _emailValidator;
  final AmountValidator _amountValidator;

  PaymentsBloc({
    required InitializeSinglePaymentUseCase initializeSinglePaymentUseCase,
    required InitializeLinkedPaymentUseCase initializeLinkedPaymentUseCase,
    required GetCreditorsUseCase getCreditorsUseCase,
    required EmailValidator emailValidator,
    required AmountValidator amountValidator,
  })  : _initializeSinglePaymentUseCase = initializeSinglePaymentUseCase,
        _initializeLinkedPaymentUseCase = initializeLinkedPaymentUseCase,
        _getCreditorsUseCase = getCreditorsUseCase,
        _emailValidator = emailValidator,
        _amountValidator = amountValidator,
        super(
          const PaymentsState(
            country: _defaultCountry,
            creditors: [],
            creditorsLoading: false,
            email: '',
            emailValidationResult: Optional.absent(),
            amount: '',
            amountValidationResult: Optional.absent(),
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
        } else if (event is InitializeLinkedBankPaymentEvent) {
          await _onInitializeLinkedBankPaymentEvent(event, emitter);
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
        emailValidationResult: const Optional.absent(),
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
        amountValidationResult: const Optional.absent(),
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

    final newState = state.copyWith(
      emailValidationResult: Optional.of(emailValidationResult),
      amountValidationResult: Optional.of(amountValidationResult),
    );

    if (!emailValidationResult.isValid ||
        !amountValidationResult.isValid ||
        !state.termsAccepted ||
        state.creditors.isEmpty) {
      emitter(
        newState.copyWith(
          termsError: !state.termsAccepted,
          generalError: Optional.fromNullable(
            state.creditors.isEmpty ? Exception('Creditors are empty') : null,
          ),
        ),
      );
      return;
    }

    emitter(
      newState.copyWith(
        openPaymentTypeDialog: true,
      ),
    );
  }

  Future<void> _onInitializeSinglePaymentEvent(
    InitializeSinglePaymentEvent event,
    Emitter<PaymentsState> emitter,
  ) async {
    emitter(state.copyWith(initializePaymentLoading: true));

    final resultState = await _handlePayment(
      state: state,
      paymentType: event.paymentType,
      getPayment: () {
        final paymentRequest =
            _getPaymentRequest(state: state, redirectUrl: event.callbackUrl);

        return _initializeSinglePaymentUseCase.invoke(
          paymentType: event.paymentType,
          paymentRequest: paymentRequest,
        );
      },
    );

    emitter(resultState);
  }

  Future<void> _onInitializeLinkedBankPaymentEvent(
    InitializeLinkedBankPaymentEvent event,
    Emitter<PaymentsState> emitter,
  ) async {
    emitter(state.copyWith(initializePaymentLoading: true));

    final resultState = await _handlePayment(
      state: state,
      paymentType: PaymentType.linked,
      getPayment: () async {
        final paymentRequest =
            _getPaymentRequest(state: state, redirectUrl: event.callbackUrl);

        return _initializeLinkedPaymentUseCase.invoke(
          linkedAccount: event.account,
          paymentRequest: paymentRequest,
        );
      },
    );

    emitter(resultState);
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

  Future<PaymentsState> _handlePayment({
    required PaymentsState state,
    required PaymentType paymentType,
    required Future<Payment> Function() getPayment,
  }) async {
    try {
      final payment = await getPayment();

      final paymentSession = PaymentSession(
        paymentId: payment.id,
        skipAuthentication: paymentType == PaymentType.linked,
        preselectedCountry: state.country.toKevinCountry(
          defaultCountry: KevinCountry.lithuania,
        ),
      );

      return state.copyWith(
        initializePaymentResult: Optional.of(paymentSession),
        initializePaymentLoading: false,
      );
    } on Exception catch (error, st) {
      Fimber.e('Error initializing payment', ex: error, stacktrace: st);
      return state.copyWith(
        generalError: Optional.of(error),
        initializePaymentLoading: false,
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
