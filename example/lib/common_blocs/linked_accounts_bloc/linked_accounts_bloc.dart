import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:domain/accounts/repository/accounts_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kevin_flutter_example/common_blocs/linked_accounts_bloc/linked_accounts_event.dart';
import 'package:kevin_flutter_example/common_blocs/linked_accounts_bloc/linked_accounts_state.dart';

class LinkedAccountsBloc
    extends Bloc<LinkedAccountsEvent, LinkedAccountsState> {
  final AccountsRepository _accountsRepository;

  LinkedAccountsBloc({
    required AccountsRepository accountsRepository,
  })  : _accountsRepository = accountsRepository,
        super(const LinkedAccountsState(accounts: [])) {
    on<LoadLinkedAccountsEvent>(
      _onLoadLinkedAccountsEvent,
      transformer: sequential(),
    );
  }

  Future<void> _onLoadLinkedAccountsEvent(
    LoadLinkedAccountsEvent event,
    Emitter<LinkedAccountsState> emitter,
  ) async {
    final accounts = await _accountsRepository.getLinkedAccounts();
    emitter(state.copyWith(accounts: accounts));
  }
}
