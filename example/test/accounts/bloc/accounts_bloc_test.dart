import 'package:bloc_test/bloc_test.dart';
import 'package:domain/accounts/model/linked_account.dart';
import 'package:domain/kevin/model/auth_scope.dart';
import 'package:domain/kevin/model/auth_state.dart';
import 'package:domain/kevin/model/linking_request.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kevin_flutter_accounts/kevin_flutter_accounts.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';
import 'package:kevin_flutter_example/accounts/bloc/accounts_bloc.dart';
import 'package:kevin_flutter_example/accounts/bloc/accounts_event.dart';
import 'package:kevin_flutter_example/accounts/bloc/accounts_state.dart';
import 'package:kevin_flutter_example/accounts/model/linking_session.dart';
import 'package:quiver/core.dart';

import '../../fakes/fake_accounts_repository.dart';
import '../../fakes/fake_auth_repository.dart';
import '../../fakes/fake_kevin_repository.dart';
import '../../test_data.dart';

const _initialState = AccountsState(
  accounts: [],
  initializeLinkingResult: Optional.absent(),
  initializeLinkingLoading: false,
  generalError: Optional.absent(),
);

void main() {
  EquatableConfig.stringify = true;

  late FakeAccountsRepository accountsRepository;
  late FakeKevinRepository kevinRepository;
  late FakeAuthRepository authRepository;
  late AccountsBloc subject;

  setUp(() {
    accountsRepository = FakeAccountsRepository();
    kevinRepository = FakeKevinRepository();
    authRepository = FakeAuthRepository();

    subject = AccountsBloc(
      accountsRepository: accountsRepository,
      kevinRepository: kevinRepository,
      authRepository: authRepository,
    );
  });

  blocTest(
    'Initial state test',
    build: () => subject,
    verify: (AccountsBloc bloc) {
      final state = bloc.state;

      expect(state, _initialState);
    },
  );

  blocTest(
    'Observe linked accounts test',
    build: () {
      return subject;
    },
    act: (AccountsBloc bloc) async {
      bloc.add(const ObserveLinkedAccountsEvent(observe: true));
      await accountsRepository.insert(account: linkedAccount);
      await accountsRepository.insert(account: linkedAccount.copyWith(id: 1));
      bloc.add(const ObserveLinkedAccountsEvent(observe: false));
      await accountsRepository.insert(account: linkedAccount.copyWith(id: 2));
    },
    expect: () {
      final oneLinkedAccountState =
          _initialState.copyWith(accounts: [linkedAccount]);
      final twoLinkedAccountsState = _initialState
          .copyWith(accounts: [linkedAccount, linkedAccount.copyWith(id: 1)]);

      return [
        oneLinkedAccountState,
        twoLinkedAccountsState,
      ];
    },
  );

  blocTest(
    'Initialize linking success test',
    build: () {
      return subject;
    },
    act: (AccountsBloc bloc) async {
      bloc.add(
        const InitializeLinkingEvent(
          authScopes: [AuthScope.accountsBasic, AuthScope.payments],
          redirectUrl: 'redirectUrl',
        ),
      );
    },
    expect: () {
      final loadingState =
          _initialState.copyWith(initializeLinkingLoading: true);
      final resultState = _initialState.copyWith(
        initializeLinkingResult: Optional.of(
          const LinkingSession(
            state: AuthState(
              authorizationLink: 'authorizationLink',
              state: 'state',
            ),
            preselectedCountry: KevinCountry.lithuania,
            disableCountrySelection: false,
          ),
        ),
      );

      expect(kevinRepository.getAuthStateCallHistory(), [
        const LinkingRequest(
          scopes: ['accounts_basic', 'payments'],
          redirectUrl: 'redirectUrl',
        ),
      ]);

      return [
        loadingState,
        resultState,
      ];
    },
  );

  blocTest(
    'Initialize linking error test',
    build: () {
      kevinRepository.setErrors(authStateError: exception);
      return subject;
    },
    act: (AccountsBloc bloc) async {
      bloc.add(
        const InitializeLinkingEvent(
          authScopes: [AuthScope.accountsBasic, AuthScope.payments],
          redirectUrl: 'redirectUrl',
        ),
      );
    },
    expect: () {
      final loadingState =
          _initialState.copyWith(initializeLinkingLoading: true);
      final errorState = _initialState.copyWith(
        generalError: Optional.of(exception),
      );

      expect(kevinRepository.getAuthStateCallHistory(), [
        const LinkingRequest(
          scopes: ['accounts_basic', 'payments'],
          redirectUrl: 'redirectUrl',
        ),
      ]);

      return [
        loadingState,
        errorState,
      ];
    },
  );

  blocTest(
    'Set linking result success test',
    build: () {
      accountsRepository.setAccounts(
        accounts: [
          linkedAccount.copyWith(bankId: 'bankId'),
        ],
      );

      return subject;
    },
    act: (AccountsBloc bloc) async {
      bloc.add(
        const SetLinkingSuccessResultEvent(
          result: KevinSessionResultLinkingSuccess(
            bank: KevinBank(
              id: 'id',
              name: 'name',
              officialName: 'officialName',
              imageUri: 'imageUri',
              bic: 'bic',
            ),
            authorizationCode: 'authorizationCode',
          ),
        ),
      );
    },
    verify: (AccountsBloc bloc) async {
      final accounts = await accountsRepository.getLinkedAccounts();
      expect(accounts, [
        linkedAccount.copyWith(bankId: 'bankId'),
        const LinkedAccount(
          id: 1,
          bankName: 'name',
          logoUrl: 'imageUri',
          linkToken: 'authorizationCode',
          bankId: 'id',
        ),
      ]);
    },
  );

  blocTest(
    'Removes accounts with same bankId on linking result success test',
    build: () {
      accountsRepository.setAccounts(
        accounts: [
          linkedAccount.copyWith(bankId: 'id'),
        ],
      );

      return subject;
    },
    act: (AccountsBloc bloc) async {
      bloc.add(
        const SetLinkingSuccessResultEvent(
          result: KevinSessionResultLinkingSuccess(
            bank: KevinBank(
              id: 'id',
              name: 'name',
              officialName: 'officialName',
              imageUri: 'imageUri',
              bic: 'bic',
            ),
            authorizationCode: 'authorizationCode',
          ),
        ),
      );
    },
    verify: (AccountsBloc bloc) async {
      final accounts = await accountsRepository.getLinkedAccounts();
      expect(accounts, [
        const LinkedAccount(
          id: 0,
          bankName: 'name',
          logoUrl: 'imageUri',
          linkToken: 'authorizationCode',
          bankId: 'id',
        ),
      ]);
    },
  );

  blocTest(
    'Remove linked account test',
    build: () {
      accountsRepository.setAccounts(
        accounts: [linkedAccount],
      );
      authRepository.putAuthToken(
        linkToken: 'linkToken',
        authToken: authToken,
      );

      return subject;
    },
    act: (AccountsBloc bloc) async {
      bloc.add(
        const RemoveLinkedAccountEvent(account: linkedAccount),
      );
    },
    verify: (AccountsBloc bloc) async {
      final accounts = await accountsRepository.getLinkedAccounts();
      final authToken = await authRepository.getAuthToken('linkToken');

      expect(accounts, []);
      expect(authToken, null);
    },
  );

  blocTest(
    'Clear initialize linking result test',
    build: () {
      return subject;
    },
    seed: () => _initialState.copyWith(
      initializeLinkingResult: Optional.of(
        const LinkingSession(
          state:
              AuthState(authorizationLink: 'authorizationLink', state: 'state'),
          preselectedCountry: KevinCountry.lithuania,
          disableCountrySelection: false,
        ),
      ),
    ),
    act: (AccountsBloc bloc) async {
      bloc.add(
        const ClearInitializeLinkingResultEvent(),
      );
    },
    verify: (AccountsBloc bloc) async {
      final state = bloc.state;

      expect(state.initializeLinkingResult, const Optional.absent());
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
    act: (AccountsBloc bloc) async {
      bloc.add(
        const ClearGeneralErrorEvent(),
      );
    },
    verify: (AccountsBloc bloc) async {
      final state = bloc.state;

      expect(state.generalError, const Optional.absent());
    },
  );
}
