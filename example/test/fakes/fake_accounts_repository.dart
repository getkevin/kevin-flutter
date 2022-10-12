import 'dart:async';

import 'package:collection/collection.dart';
import 'package:domain/accounts/model/linked_account.dart';
import 'package:domain/accounts/repository/accounts_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rxdart/rxdart.dart';

class FakeAccountsRepository extends Fake implements AccountsRepository {
  final _subject = BehaviorSubject<List<LinkedAccount>>.seeded([]);

  @override
  Stream<List<LinkedAccount>> getLinkedAccountsStream() {
    return _subject.stream;
  }

  @override
  Future<List<LinkedAccount>> getLinkedAccounts() async {
    return _currentAccounts();
  }

  @override
  Future<List<LinkedAccount>> getLinkedAccountsByBankId(String bankId) async {
    final accounts = _currentAccounts();
    return accounts.where((a) => a.bankId == bankId).toList();
  }

  @override
  Future<LinkedAccount?> getById(int id) async {
    final accounts = _currentAccounts();
    return accounts.firstWhereOrNull((a) => a.id == id);
  }

  @override
  Future<void> insert({
    required LinkedAccount account,
    bool replace = true,
  }) async {
    final accounts = _currentAccounts();

    if (replace) {
      final id = accounts.indexWhere((a) => a.id == account.id);

      if (id != -1) {
        accounts[id] = account;
      } else {
        final index = accounts.length;
        accounts.add(account.copyWith(id: index));
      }
    } else {
      final index = accounts.length;
      accounts.add(account.copyWith(id: index));
    }

    _subject.add(accounts);
  }

  @override
  Future<void> deleteById(int id) async {
    final accounts = _currentAccounts();
    accounts.removeWhere((a) => a.id == id);
    _subject.add(accounts);
  }

  @override
  Future<void> deleteByBankId(String bankId) async {
    final accounts = _currentAccounts();
    accounts.removeWhere((a) => a.bankId == bankId);
    _subject.add(accounts);
  }

  @override
  Future<void> deleteByBankIdAndInsert({
    required String bankId,
    required LinkedAccount account,
  }) async {
    await deleteByBankId(bankId);
    await insert(account: account);
  }

  void setAccounts({required List<LinkedAccount> accounts}) {
    _subject.add(accounts);
  }

  List<LinkedAccount> _currentAccounts() => List.of(_subject.value);
}
