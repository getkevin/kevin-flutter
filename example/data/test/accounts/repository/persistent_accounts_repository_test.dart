import 'dart:async';

import 'package:data/accounts/entity/linked_account_entity.dart';
import 'package:data/accounts/repository/persistent_accounts_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';

import '../../test_data.dart';

void main() {
  late Box<LinkedAccountEntity> accountsBox;
  late PersistentAccountsRepository subject;

  setUp(() async {
    await setUpTestHive();
    Hive.registerAdapter(
      LinkedAccountEntityAdapter(),
    );

    accountsBox = await Hive.openBox('accountsTestBox');
    subject = PersistentAccountsRepository(accountsBox: accountsBox);
  });

  tearDown(() async {
    await tearDownTestHive();
    Hive.resetAdapters();
  });

  test('Receive new linked accounts stream test', () async {
    final result = subject.getLinkedAccountsStream();

    unawaited(
      expectLater(
        result,
        emitsInOrder([
          [linkedAccount],
          [linkedAccount, linkedAccount.copyWith(id: 1)],
        ]),
      ),
    );

    await subject.insert(account: linkedAccount);
    await subject.insert(account: linkedAccount.copyWith(id: 1));
  });

  test('Emits already existing accounts on subscription start test', () async {
    await subject.insert(account: linkedAccount);

    final result = subject.getLinkedAccountsStream();

    unawaited(
      expectLater(
        result,
        emitsInOrder([
          [linkedAccount],
          [linkedAccount, linkedAccount.copyWith(id: 1)],
        ]),
      ),
    );

    await Future.delayed(const Duration(milliseconds: 5));

    await subject.insert(account: linkedAccount.copyWith(id: 1));
  });

  test('Different stream listeners test', () async {
    final result = subject.getLinkedAccountsStream();
    final result1 = subject.getLinkedAccountsStream();

    // Received all 3 accounts events
    unawaited(
      expectLater(
        result,
        emitsInOrder([
          [linkedAccount],
          [linkedAccount, linkedAccount.copyWith(id: 1)],
          [
            linkedAccount,
            linkedAccount.copyWith(id: 1),
            linkedAccount.copyWith(id: 2),
          ],
        ]),
      ),
    );

    await subject.insert(account: linkedAccount);
    await subject.insert(account: linkedAccount.copyWith(id: 1));

    // Received 2 accounts events:
    // - current accounts on subscription start
    // - subsequent accounts update
    unawaited(
      expectLater(
        result1,
        emitsInOrder([
          [linkedAccount, linkedAccount.copyWith(id: 1)],
          [
            linkedAccount,
            linkedAccount.copyWith(id: 1),
            linkedAccount.copyWith(id: 2),
          ],
        ]),
      ),
    );

    await Future.delayed(const Duration(milliseconds: 5));

    await subject.insert(account: linkedAccount.copyWith(id: 2));
  });

  test('Get current linked accounts test', () async {
    await subject.insert(account: linkedAccount);
    await subject.insert(account: linkedAccount.copyWith(id: 1));

    final result = await subject.getLinkedAccounts();

    expect(result, [linkedAccount, linkedAccount.copyWith(id: 1)]);
  });

  test('Get linked accounts by bank id test', () async {
    await subject.insert(account: linkedAccount);
    await subject.insert(account: linkedAccount.copyWith(id: 1));
    await subject.insert(
      account: linkedAccount.copyWith(id: 2, bankId: 'otherBankId'),
    );

    final result = await subject.getLinkedAccountsByBankId('bankId');

    expect(result, [linkedAccount, linkedAccount.copyWith(id: 1)]);
  });

  test('Get linked accounts by id success test', () async {
    await subject.insert(account: linkedAccount);
    await subject.insert(account: linkedAccount.copyWith(id: 1));
    await subject.insert(account: linkedAccount.copyWith(id: 2));

    final result = await subject.getById(1);

    expect(result, linkedAccount.copyWith(id: 1));
  });

  test('Get linked accounts by id absent test', () async {
    await subject.insert(account: linkedAccount);
    await subject.insert(account: linkedAccount.copyWith(id: 1));
    await subject.insert(account: linkedAccount.copyWith(id: 2));

    final result = await subject.getById(4);

    expect(result, null);
  });

  test('Insert account test', () async {
    await subject.insert(account: linkedAccount);

    final result = await subject.getLinkedAccounts();

    expect(result, [linkedAccount]);
  });

  test('Insert existing account when replace == true test', () async {
    await subject.insert(account: linkedAccount);
    await subject.insert(account: linkedAccount);

    final result = await subject.getLinkedAccounts();

    expect(result, [linkedAccount]);
  });

  test('Insert existing when account replace == false test', () async {
    await subject.insert(account: linkedAccount);
    await subject.insert(account: linkedAccount, replace: false);

    final result = await subject.getLinkedAccounts();

    expect(result, [linkedAccount, linkedAccount.copyWith(id: 1)]);
  });

  test('Increment id on inserting existing account when replace == false test',
      () async {
    await subject.insert(account: linkedAccount);
    await subject.insert(account: linkedAccount.copyWith(id: 1));
    await subject.insert(account: linkedAccount, replace: false);

    final result = await subject.getLinkedAccounts();

    expect(result, [
      linkedAccount,
      linkedAccount.copyWith(id: 1),
      linkedAccount.copyWith(id: 2),
    ]);
  });

  test('Insert accounts with id == -1 test', () async {
    await subject.insert(account: linkedAccount);
    await subject.insert(account: linkedAccount.copyWith(id: -1));

    final result = await subject.getLinkedAccounts();

    expect(result, [
      linkedAccount,
      linkedAccount.copyWith(id: 1),
    ]);
  });

  test('Delete account by id test', () async {
    await subject.insert(account: linkedAccount);
    await subject.insert(account: linkedAccount.copyWith(id: 1));

    await subject.deleteById(1);

    final result = await subject.getLinkedAccounts();

    expect(result, [
      linkedAccount,
    ]);
  });

  test('Delete account by bank id test', () async {
    await subject.insert(account: linkedAccount);
    await subject.insert(account: linkedAccount.copyWith(id: 1));
    await subject.insert(
      account: linkedAccount.copyWith(
        id: 2,
        bankId: 'otherBankId',
      ),
    );

    await subject.deleteByBankId('bankId');

    final result = await subject.getLinkedAccounts();

    expect(result, [
      linkedAccount.copyWith(
        id: 2,
        bankId: 'otherBankId',
      ),
    ]);
  });

  test('Delete account by bank id and insert test', () async {
    await subject.insert(account: linkedAccount.copyWith(id: 1));
    await subject.insert(
      account: linkedAccount.copyWith(
        id: 2,
        bankId: 'otherBankId',
      ),
    );

    await subject.deleteByBankIdAndInsert(
      bankId: 'bankId',
      account: linkedAccount,
    );

    final result = await subject.getLinkedAccounts();

    expect(result, [
      linkedAccount,
      linkedAccount.copyWith(
        id: 2,
        bankId: 'otherBankId',
      ),
    ]);
  });
}
