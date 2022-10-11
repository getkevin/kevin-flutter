import 'package:bloc_test/bloc_test.dart';
import 'package:domain/country/model/country.dart';
import 'package:domain/payments/model/creditor.dart';
import 'package:domain/payments/model/creditor_account.dart';
import 'package:domain/payments/model/payment_type.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';
import 'package:kevin_flutter_example/generated/locale_keys.g.dart';
import 'package:kevin_flutter_example/payments/bloc/payments_bloc.dart';
import 'package:kevin_flutter_example/payments/bloc/payments_event.dart';
import 'package:kevin_flutter_example/payments/bloc/payments_state.dart';
import 'package:kevin_flutter_example/payments/model/creditor_list_item.dart';
import 'package:kevin_flutter_example/payments/model/payment_session.dart';
import 'package:kevin_flutter_example/theme/app_images.dart';
import 'package:kevin_flutter_example/validation/model/validation_result.dart';
import 'package:kevin_flutter_in_app_payments/kevin_flutter_in_app_payments.dart';
import 'package:quiver/core.dart';

import '../../fakes/fake_amount_validator.dart';
import '../../fakes/fake_email_validator.dart';
import '../../fakes/fake_get_creditors_use_case.dart';
import '../../fakes/fake_initialize_linked_payment_use_case.dart';
import '../../fakes/fake_initialize_single_payment_use_case.dart';
import '../../test_data.dart';

const _defaultCountry = Country(
  code: 'LT',
  flagKey: AppImages.flagLt,
  nameKey: LocaleKeys.country_lt,
);

const _initialState = PaymentsState(
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
);

const _creditor = Creditor(
  logo: 'logo',
  name: 'name',
  accounts: [CreditorAccount(currencyCode: 'currencyCode', iban: 'iban')],
);

const _creditor1 = Creditor(
  logo: 'logo1',
  name: 'name1',
  accounts: [CreditorAccount(currencyCode: 'currencyCode1', iban: 'iban1')],
);

const _creditor2 = Creditor(
  logo: 'logo2',
  name: 'name2',
  accounts: [CreditorAccount(currencyCode: 'currencyCode2', iban: 'iban2')],
);

const _creditors = [_creditor, _creditor1, _creditor2];

void main() {
  EquatableConfig.stringify = true;

  late FakeInitializeSinglePaymentUseCase initializeSinglePaymentUseCase;
  late FakeInitializeLinkedPaymentUseCase initializeLinkedPaymentUseCase;
  late FakeGetCreditorsUseCase getCreditorsUseCase;
  late FakeEmailValidator emailValidator;
  late FakeAmountValidator amountValidator;
  late PaymentsBloc subject;

  setUp(() {
    initializeSinglePaymentUseCase = FakeInitializeSinglePaymentUseCase();
    initializeLinkedPaymentUseCase = FakeInitializeLinkedPaymentUseCase();
    getCreditorsUseCase = FakeGetCreditorsUseCase();
    emailValidator = FakeEmailValidator();
    amountValidator = FakeAmountValidator();

    subject = PaymentsBloc(
      initializeSinglePaymentUseCase: initializeSinglePaymentUseCase,
      initializeLinkedPaymentUseCase: initializeLinkedPaymentUseCase,
      getCreditorsUseCase: getCreditorsUseCase,
      emailValidator: emailValidator,
      amountValidator: amountValidator,
    );
  });

  blocTest(
    'Initial state test',
    build: () => subject,
    verify: (PaymentsBloc bloc) {
      final state = bloc.state;

      expect(state, _initialState);
    },
  );

  blocTest(
    'Initial load success test',
    build: () {
      getCreditorsUseCase.setCreditors(
        creditors: _creditors,
      );
      return subject;
    },
    act: (PaymentsBloc bloc) {
      bloc.add(const InitialLoadEvent());
    },
    expect: () {
      final loadingState = _initialState.copyWith(creditorsLoading: true);
      final creditorsState = _initialState.copyWith(
        creditors: [
          _creditor.toListItem(selected: true),
          _creditor1.toListItem(),
          _creditor2.toListItem(),
        ],
      );

      expect(getCreditorsUseCase.getCountryCodes(), ['LT']);

      return [
        loadingState,
        creditorsState,
      ];
    },
  );

  blocTest(
    'Initial load error test',
    build: () {
      getCreditorsUseCase.setError(error: exception);
      return subject;
    },
    act: (PaymentsBloc bloc) {
      bloc.add(const InitialLoadEvent());
    },
    verify: (PaymentsBloc bloc) {
      final state = bloc.state;

      expect(getCreditorsUseCase.getCountryCodes(), ['LT']);
      expect(state.generalError, Optional.of(exception));
    },
  );

  blocTest(
    'Set country success test',
    build: () {
      getCreditorsUseCase.setCreditors(creditors: _creditors);
      return subject;
    },
    act: (PaymentsBloc bloc) {
      bloc.add(const SetCountryEvent(country: lithuania));
      bloc.add(const SetCountryEvent(country: latvia));
      bloc.add(const SetCountryEvent(country: estonia));
    },
    verify: (PaymentsBloc bloc) {
      final state = bloc.state;

      expect(getCreditorsUseCase.getCountryCodes(), [
        'LT',
        'LV',
        'EE',
      ]);
      expect(state.creditors, [
        _creditor.toListItem(selected: true),
        _creditor1.toListItem(),
        _creditor2.toListItem(),
      ]);
    },
  );

  blocTest(
    'Set country error test',
    build: () {
      getCreditorsUseCase.setError(error: exception);
      return subject;
    },
    act: (PaymentsBloc bloc) {
      bloc.add(const SetCountryEvent(country: lithuania));
    },
    verify: (PaymentsBloc bloc) {
      final state = bloc.state;

      expect(getCreditorsUseCase.getCountryCodes(), [
        'LT',
      ]);
      expect(state.generalError, Optional.of(exception));
    },
  );

  blocTest(
    'Set creditor test',
    build: () {
      return subject;
    },
    seed: () => _initialState.copyWith(
      creditors: [
        _creditor.toListItem(selected: true),
        _creditor1.toListItem(),
        _creditor2.toListItem(),
      ],
    ),
    act: (PaymentsBloc bloc) {
      bloc.add(SetCreditorEvent(creditor: _creditor1.toListItem()));
      bloc.add(SetCreditorEvent(creditor: _creditor2.toListItem()));
    },
    expect: () {
      final creditor1SelectedState = _initialState.copyWith(
        creditors: [
          _creditor.toListItem(),
          _creditor1.toListItem(selected: true),
          _creditor2.toListItem(),
        ],
      );
      final creditor2SelectedState = _initialState.copyWith(
        creditors: [
          _creditor.toListItem(),
          _creditor1.toListItem(),
          _creditor2.toListItem(selected: true),
        ],
      );

      return [creditor1SelectedState, creditor2SelectedState];
    },
  );

  blocTest(
    'Set emails test',
    build: () {
      return subject;
    },
    act: (PaymentsBloc bloc) {
      bloc.add(const SetEmailEvent(email: 'email'));
      bloc.add(const SetEmailEvent(email: 'email1'));
      bloc.add(const SetEmailEvent(email: 'email2'));
      bloc.add(const SetEmailEvent(email: 'email2'));
    },
    expect: () => [
      _initialState.copyWith(email: 'email'),
      _initialState.copyWith(email: 'email1'),
      _initialState.copyWith(email: 'email2'),
    ],
  );

  blocTest(
    'Clear email validation result test',
    build: () {
      return subject;
    },
    seed: () => _initialState.copyWith(
      emailValidationResult:
          Optional.of(const ValidationResultInvalid(messageKey: '')),
    ),
    act: (PaymentsBloc bloc) {
      bloc.add(const SetEmailEvent(email: 'email'));
    },
    verify: (PaymentsBloc bloc) {
      final state = bloc.state;

      expect(state.email, 'email');
      expect(state.emailValidationResult, const Optional.absent());
    },
  );

  blocTest(
    'Set amount test',
    build: () {
      return subject;
    },
    act: (PaymentsBloc bloc) {
      bloc.add(const SetAmountEvent(amount: '0'));
      bloc.add(const SetAmountEvent(amount: '1'));
      bloc.add(const SetAmountEvent(amount: '0,5'));
      bloc.add(const SetAmountEvent(amount: '0,5'));
    },
    expect: () => [
      _initialState.copyWith(amount: '0'),
      _initialState.copyWith(amount: '1'),
      _initialState.copyWith(amount: '0.5'),
    ],
  );

  blocTest(
    'Clear amount validation result test',
    build: () {
      return subject;
    },
    seed: () => _initialState.copyWith(
      amountValidationResult:
          Optional.of(const ValidationResultInvalid(messageKey: '')),
    ),
    act: (PaymentsBloc bloc) {
      bloc.add(const SetAmountEvent(amount: '1'));
    },
    verify: (PaymentsBloc bloc) {
      final state = bloc.state;

      expect(state.amount, '1');
      expect(state.amountValidationResult, const Optional.absent());
    },
  );

  blocTest(
    'Set terms accepted test',
    build: () {
      return subject;
    },
    act: (PaymentsBloc bloc) {
      bloc.add(const SetTermsAcceptedEvent(accepted: true));
      bloc.add(const SetTermsAcceptedEvent(accepted: false));
    },
    expect: () => [
      _initialState.copyWith(termsAccepted: true),
      _initialState.copyWith(termsAccepted: false),
    ],
  );

  blocTest(
    'Clear terms accepted error test',
    build: () {
      return subject;
    },
    seed: () => _initialState.copyWith(termsError: true),
    act: (PaymentsBloc bloc) {
      bloc.add(const SetTermsAcceptedEvent(accepted: true));
    },
    verify: (PaymentsBloc bloc) {
      final state = bloc.state;

      expect(state.termsAccepted, true);
      expect(state.termsError, false);
    },
  );

  blocTest(
    'Validate payment success test',
    build: () {
      emailValidator.setValidationResult(result: const ValidationResultValid());
      amountValidator.setValidationResult(
        result: const ValidationResultValid(),
      );
      return subject;
    },
    seed: () => _initialState.copyWith(
      termsAccepted: true,
      creditors: [_creditor.toListItem(selected: true)],
    ),
    act: (PaymentsBloc bloc) {
      bloc.add(const ValidatePaymentEvent());
    },
    verify: (PaymentsBloc bloc) {
      final state = bloc.state;

      expect(state.openPaymentTypeDialog, true);
      expect(state.termsAccepted, true);
      expect(state.termsError, false);
      expect(
        state.emailValidationResult,
        Optional.of(const ValidationResultValid()),
      );
      expect(
        state.amountValidationResult,
        Optional.of(const ValidationResultValid()),
      );
      expect(state.generalError, const Optional.absent());
    },
  );

  blocTest(
    'Validate payment email fail test',
    build: () {
      amountValidator.setValidationResult(
        result: const ValidationResultValid(),
      );
      return subject;
    },
    seed: () => _initialState.copyWith(
      termsAccepted: true,
      creditors: [_creditor.toListItem(selected: true)],
    ),
    act: (PaymentsBloc bloc) {
      bloc.add(const ValidatePaymentEvent());
    },
    verify: (PaymentsBloc bloc) {
      final state = bloc.state;

      expect(state.openPaymentTypeDialog, false);
      expect(state.termsAccepted, true);
      expect(state.termsError, false);
      expect(
        state.emailValidationResult,
        Optional.of(const ValidationResultInvalid(messageKey: 'messageKey')),
      );
      expect(
        state.amountValidationResult,
        Optional.of(const ValidationResultValid()),
      );
      expect(state.generalError, const Optional.absent());
    },
  );

  blocTest(
    'Validate payment amount fail test',
    build: () {
      emailValidator.setValidationResult(
        result: const ValidationResultValid(),
      );
      return subject;
    },
    seed: () => _initialState.copyWith(
      termsAccepted: true,
      creditors: [_creditor.toListItem(selected: true)],
    ),
    act: (PaymentsBloc bloc) {
      bloc.add(const ValidatePaymentEvent());
    },
    verify: (PaymentsBloc bloc) {
      final state = bloc.state;

      expect(state.openPaymentTypeDialog, false);
      expect(state.termsAccepted, true);
      expect(state.termsError, false);
      expect(
        state.emailValidationResult,
        Optional.of(const ValidationResultValid()),
      );
      expect(
        state.amountValidationResult,
        Optional.of(const ValidationResultInvalid(messageKey: 'messageKey')),
      );
      expect(state.generalError, const Optional.absent());
    },
  );

  blocTest(
    'Validate payment terms fail test',
    build: () {
      amountValidator.setValidationResult(
        result: const ValidationResultValid(),
      );
      emailValidator.setValidationResult(
        result: const ValidationResultValid(),
      );
      return subject;
    },
    seed: () => _initialState.copyWith(
      creditors: [_creditor.toListItem(selected: true)],
    ),
    act: (PaymentsBloc bloc) {
      bloc.add(const ValidatePaymentEvent());
    },
    verify: (PaymentsBloc bloc) {
      final state = bloc.state;

      expect(state.openPaymentTypeDialog, false);
      expect(state.termsAccepted, false);
      expect(state.termsError, true);
      expect(
        state.emailValidationResult,
        Optional.of(const ValidationResultValid()),
      );
      expect(
        state.amountValidationResult,
        Optional.of(const ValidationResultValid()),
      );
      expect(state.generalError, const Optional.absent());
    },
  );

  blocTest(
    'Validate payment creditors absent test',
    build: () {
      amountValidator.setValidationResult(
        result: const ValidationResultValid(),
      );
      emailValidator.setValidationResult(
        result: const ValidationResultValid(),
      );
      return subject;
    },
    seed: () => _initialState.copyWith(
      termsAccepted: true,
    ),
    act: (PaymentsBloc bloc) {
      bloc.add(const ValidatePaymentEvent());
    },
    verify: (PaymentsBloc bloc) {
      final state = bloc.state;

      expect(state.openPaymentTypeDialog, false);
      expect(state.termsAccepted, true);
      expect(state.termsError, false);
      expect(
        state.emailValidationResult,
        Optional.of(const ValidationResultValid()),
      );
      expect(
        state.amountValidationResult,
        Optional.of(const ValidationResultValid()),
      );
      expect(state.generalError, isA<Optional<Exception>>());
    },
  );

  blocTest(
    'Initialize payment emits loading state test',
    build: () {
      return subject;
    },
    seed: () => _initialState
        .copyWith(creditors: [_creditor.toListItem(selected: true)]),
    act: (PaymentsBloc bloc) {
      bloc.add(
        const InitializeSinglePaymentEvent(
          paymentType: PaymentType.bank,
          callbackUrl: 'callbackUrl',
        ),
      );
      bloc.add(
        const InitializeLinkedBankPaymentEvent(
          account: linkedAccount,
          callbackUrl: 'callbackUrl',
        ),
      );
    },
    expect: () {
      final paymentLoadingState = _initialState.copyWith(
        initializePaymentLoading: true,
        creditors: [_creditor.toListItem(selected: true)],
      );
      final paymentResultState = paymentLoadingState.copyWith(
        initializePaymentLoading: false,
        initializePaymentResult: Optional.of(
          const PaymentSession(
            paymentId: 'bankPaymentId',
            paymentType: KevinPaymentType.bank,
            skipAuthentication: false,
            preselectedCountry: KevinCountry.lithuania,
          ),
        ),
        creditors: [_creditor.toListItem(selected: true)],
      );

      final linkedPaymentLoadingState =
          paymentResultState.copyWith(initializePaymentLoading: true);
      final linkedPaymentResultState = linkedPaymentLoadingState.copyWith(
        initializePaymentLoading: false,
        initializePaymentResult: Optional.of(
          const PaymentSession(
            paymentId: 'linkedPaymentId',
            paymentType: KevinPaymentType.bank,
            skipAuthentication: true,
            preselectedCountry: KevinCountry.lithuania,
          ),
        ),
        creditors: [_creditor.toListItem(selected: true)],
      );

      return [
        paymentLoadingState,
        paymentResultState,
        linkedPaymentLoadingState,
        linkedPaymentResultState,
      ];
    },
  );

  blocTest(
    'Initialize bank payment success test',
    build: () {
      return subject;
    },
    seed: () => _initialState.copyWith(
      amount: '1',
      email: 'test@test.com',
      creditors: [_creditor.toListItem(selected: true)],
    ),
    act: (PaymentsBloc bloc) {
      bloc.add(
        const InitializeSinglePaymentEvent(
          paymentType: PaymentType.bank,
          callbackUrl: 'callbackUrl',
        ),
      );
    },
    verify: (PaymentsBloc bloc) {
      final state = bloc.state;

      const paymentSession = PaymentSession(
        paymentId: 'bankPaymentId',
        paymentType: KevinPaymentType.bank,
        skipAuthentication: false,
        preselectedCountry: KevinCountry.lithuania,
      );

      expect(
        state.initializePaymentResult,
        Optional.of(paymentSession),
      );
      expect(initializeSinglePaymentUseCase.getRequestHistory(), [
        {PaymentType.bank: paymentRequest}
      ]);
    },
  );

  blocTest(
    'Initialize bank payment error test',
    build: () {
      initializeSinglePaymentUseCase.setError(error: exception);
      return subject;
    },
    seed: () => _initialState.copyWith(
      amount: '1',
      email: 'test@test.com',
      creditors: [_creditor.toListItem(selected: true)],
    ),
    act: (PaymentsBloc bloc) {
      bloc.add(
        const InitializeSinglePaymentEvent(
          paymentType: PaymentType.bank,
          callbackUrl: 'callbackUrl',
        ),
      );
    },
    verify: (PaymentsBloc bloc) {
      final state = bloc.state;

      expect(state.generalError, Optional.of(exception));
      expect(
        state.initializePaymentResult,
        const Optional.absent(),
      );
      expect(initializeSinglePaymentUseCase.getRequestHistory(), [
        {PaymentType.bank: paymentRequest}
      ]);
    },
  );

  blocTest(
    'Initialize card payment success test',
    build: () {
      return subject;
    },
    seed: () => _initialState.copyWith(
      amount: '1',
      email: 'test@test.com',
      creditors: [_creditor.toListItem(selected: true)],
    ),
    act: (PaymentsBloc bloc) {
      bloc.add(
        const InitializeSinglePaymentEvent(
          paymentType: PaymentType.card,
          callbackUrl: 'callbackUrl',
        ),
      );
    },
    verify: (PaymentsBloc bloc) {
      final state = bloc.state;

      const paymentSession = PaymentSession(
        paymentId: 'cardPaymentId',
        paymentType: KevinPaymentType.card,
        skipAuthentication: false,
        preselectedCountry: KevinCountry.lithuania,
      );

      expect(
        state.initializePaymentResult,
        Optional.of(paymentSession),
      );
      expect(initializeSinglePaymentUseCase.getRequestHistory(), [
        {PaymentType.card: paymentRequest}
      ]);
    },
  );

  blocTest(
    'Initialize card payment error test',
    build: () {
      initializeSinglePaymentUseCase.setError(error: exception);
      return subject;
    },
    seed: () => _initialState.copyWith(
      amount: '1',
      email: 'test@test.com',
      creditors: [_creditor.toListItem(selected: true)],
    ),
    act: (PaymentsBloc bloc) {
      bloc.add(
        const InitializeSinglePaymentEvent(
          paymentType: PaymentType.card,
          callbackUrl: 'callbackUrl',
        ),
      );
    },
    verify: (PaymentsBloc bloc) {
      final state = bloc.state;

      expect(state.generalError, Optional.of(exception));
      expect(
        state.initializePaymentResult,
        const Optional.absent(),
      );
      expect(initializeSinglePaymentUseCase.getRequestHistory(), [
        {PaymentType.card: paymentRequest}
      ]);
    },
  );

  blocTest(
    'Initialize linked payment success test',
    build: () {
      return subject;
    },
    seed: () => _initialState.copyWith(
      amount: '1',
      email: 'test@test.com',
      creditors: [_creditor.toListItem(selected: true)],
    ),
    act: (PaymentsBloc bloc) {
      bloc.add(
        const InitializeLinkedBankPaymentEvent(
          account: linkedAccount,
          callbackUrl: 'callbackUrl',
        ),
      );
    },
    verify: (PaymentsBloc bloc) {
      final state = bloc.state;

      const paymentSession = PaymentSession(
        paymentId: 'linkedPaymentId',
        paymentType: KevinPaymentType.bank,
        skipAuthentication: true,
        preselectedCountry: KevinCountry.lithuania,
      );

      expect(
        state.initializePaymentResult,
        Optional.of(paymentSession),
      );
      expect(initializeLinkedPaymentUseCase.getRequestHistory(), [
        {linkedAccount: paymentRequest}
      ]);
    },
  );

  blocTest(
    'Initialize linked payment error test',
    build: () {
      initializeLinkedPaymentUseCase.setError(error: exception);
      return subject;
    },
    seed: () => _initialState.copyWith(
      amount: '1',
      email: 'test@test.com',
      creditors: [_creditor.toListItem(selected: true)],
    ),
    act: (PaymentsBloc bloc) {
      bloc.add(
        const InitializeLinkedBankPaymentEvent(
          account: linkedAccount,
          callbackUrl: 'callbackUrl',
        ),
      );
    },
    verify: (PaymentsBloc bloc) {
      final state = bloc.state;

      expect(state.generalError, Optional.of(exception));
      expect(
        state.initializePaymentResult,
        const Optional.absent(),
      );
      expect(initializeLinkedPaymentUseCase.getRequestHistory(), [
        {linkedAccount: paymentRequest}
      ]);
    },
  );

  blocTest(
    'Clear open payment type dialog test',
    build: () {
      return subject;
    },
    seed: () => _initialState.copyWith(
      openPaymentTypeDialog: true,
    ),
    act: (PaymentsBloc bloc) {
      bloc.add(
        const ClearOpenPaymentTypeDialogEvent(),
      );
    },
    verify: (PaymentsBloc bloc) {
      final state = bloc.state;

      expect(state.openPaymentTypeDialog, false);
    },
  );

  blocTest(
    'Clear general error test',
    build: () {
      return subject;
    },
    seed: () => _initialState.copyWith(
      generalError: Optional.of(exception),
    ),
    act: (PaymentsBloc bloc) {
      bloc.add(
        const ClearGeneralErrorEvent(),
      );
    },
    verify: (PaymentsBloc bloc) {
      final state = bloc.state;

      expect(state.generalError, const Optional.absent());
    },
  );

  blocTest(
    'Clear initialize payment result test',
    build: () {
      return subject;
    },
    seed: () => _initialState.copyWith(
      initializePaymentResult: Optional.of(
        const PaymentSession(
          paymentId: 'linkedPaymentId',
          paymentType: KevinPaymentType.bank,
          skipAuthentication: true,
          preselectedCountry: KevinCountry.lithuania,
        ),
      ),
    ),
    act: (PaymentsBloc bloc) {
      bloc.add(
        const ClearInitializePaymentResultEvent(),
      );
    },
    verify: (PaymentsBloc bloc) {
      final state = bloc.state;

      expect(state.initializePaymentResult, const Optional.absent());
    },
  );

  blocTest(
    'Clear user input fields test',
    build: () {
      return subject;
    },
    seed: () => _initialState.copyWith(
      email: 'email',
      amount: '1',
      termsAccepted: true,
    ),
    act: (PaymentsBloc bloc) {
      bloc.add(
        const ClearUserInputFieldsEvent(),
      );
    },
    verify: (PaymentsBloc bloc) {
      final state = bloc.state;

      expect(state.email, 'email');
      expect(state.amount, '');
      expect(state.termsAccepted, false);
      expect(state.userInputFieldsUpdated, true);
    },
  );

  blocTest(
    'Clear user input fields updated test',
    build: () {
      return subject;
    },
    seed: () => _initialState.copyWith(userInputFieldsUpdated: true),
    act: (PaymentsBloc bloc) {
      bloc.add(
        const ClearUserInputFieldsUpdatedEvent(),
      );
    },
    verify: (PaymentsBloc bloc) {
      final state = bloc.state;

      expect(state.userInputFieldsUpdated, false);
    },
  );
}

extension ToCreditorListItem on Creditor {
  CreditorListItem toListItem({bool selected = false}) => CreditorListItem(
        logo: logo,
        name: name,
        iban: accounts.first.iban,
        selected: selected,
      );
}
