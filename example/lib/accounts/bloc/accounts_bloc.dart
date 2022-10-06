import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/accounts/model/linked_account.dart';
import 'package:domain/accounts/repository/accounts_repository.dart';
import 'package:domain/auth/repository/auth_repository.dart';
import 'package:domain/kevin/model/linking_request.dart';
import 'package:domain/kevin/repository/kevin_repository.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevin_flutter_core/kevin_flutter_core.dart';
import 'package:kevin_flutter_example/accounts/bloc/accounts_event.dart';
import 'package:kevin_flutter_example/accounts/bloc/accounts_state.dart';
import 'package:kevin_flutter_example/accounts/model/linking_session.dart';
import 'package:quiver/core.dart';

class AccountsBloc extends Bloc<AccountsEvent, AccountsState> {
  final AccountsRepository _accountsRepository;
  final KevinRepository _kevinRepository;
  final AuthRepository _authRepository;

  AccountsBloc({
    required AccountsRepository accountsRepository,
    required KevinRepository kevinRepository,
    required AuthRepository authRepository,
  })  : _accountsRepository = accountsRepository,
        _kevinRepository = kevinRepository,
        _authRepository = authRepository,
        super(
          const AccountsState(
            accounts: [],
            initializeLinkingResult: Optional.absent(),
            initializeLinkingLoading: false,
            generalError: Optional.absent(),
          ),
        ) {
    on<ObserveLinkedAccountsEvent>(
      _onObserveLinkedAccountsEvent,
      transformer: restartable(),
    );
    on<AccountsEvent>(
      (event, emitter) async {
        if (event is InitializeLinkingEvent) {
          await _onInitializeLinkingEvent(event, emitter);
        } else if (event is SetLinkingSuccessResultEvent) {
          await _onSetLinkingResultSuccessEvent(event, emitter);
        } else if (event is RemoveLinkedAccountEvent) {
          await _onRemoveLinkedAccountEvent(event, emitter);
        } else if (event is ClearInitializeLinkingResultEvent) {
          await _onClearInitializeLinkingResultEvent(event, emitter);
        } else if (event is ClearGeneralErrorEvent) {
          await _onClearGeneralErrorEvent(event, emitter);
        }
      },
      transformer: sequential(),
    );
  }

  Future<void> _onObserveLinkedAccountsEvent(
    ObserveLinkedAccountsEvent event,
    Emitter<AccountsState> emitter,
  ) async {
    if (emitter.isDone || !event.observe) return;

    await emitter.forEach(
      _accountsRepository.getLinkedAccountsStream(),
      onData: (List<LinkedAccount> accounts) {
        return state.copyWith(accounts: accounts);
      },
    );
  }

  Future<void> _onInitializeLinkingEvent(
    InitializeLinkingEvent event,
    Emitter<AccountsState> emitter,
  ) async {
    emitter(state.copyWith(initializeLinkingLoading: true));
    try {
      final authState = await _kevinRepository.getAuthState(
        LinkingRequest(
          scopes: event.authScopes.map((s) => s.key).toList(),
          redirectUrl: event.redirectUrl,
        ),
      );

      final linkingSession = LinkingSession(
        state: authState,
        preselectedCountry: KevinCountry.lithuania,
        disableCountrySelection: false,
      );

      emitter(
        state.copyWith(
          initializeLinkingResult: Optional.of(linkingSession),
          initializeLinkingLoading: false,
        ),
      );
    } on Exception catch (error, st) {
      Fimber.e('Error initializing account linking', ex: error, stacktrace: st);
      emitter(
        state.copyWith(
          initializeLinkingLoading: false,
          generalError: Optional.of(error),
        ),
      );
    }
  }

  Future<void> _onSetLinkingResultSuccessEvent(
    SetLinkingSuccessResultEvent event,
    Emitter<AccountsState> emitter,
  ) async {
    final bank = event.result.bank;

    if (bank == null) return;

    final account = LinkedAccount(
      id: -1,
      bankName: bank.name,
      logoUrl: bank.imageUri,
      linkToken: event.result.authorizationCode,
      bankId: bank.id,
    );

    await _accountsRepository.deleteByBankId(bank.id);
    await _accountsRepository.insert(account: account);
  }

  Future<void> _onRemoveLinkedAccountEvent(
    RemoveLinkedAccountEvent event,
    Emitter<AccountsState> emitter,
  ) async {
    await _accountsRepository.deleteById(event.account.id);
    await _authRepository.removeAuthToken(event.account.linkToken);
  }

  Future<void> _onClearInitializeLinkingResultEvent(
    ClearInitializeLinkingResultEvent event,
    Emitter<AccountsState> emitter,
  ) async {
    emitter(state.copyWith(initializeLinkingResult: const Optional.absent()));
  }

  Future<void> _onClearGeneralErrorEvent(
    ClearGeneralErrorEvent event,
    Emitter<AccountsState> emitter,
  ) async {
    emitter(state.copyWith(generalError: const Optional.absent()));
  }
}
