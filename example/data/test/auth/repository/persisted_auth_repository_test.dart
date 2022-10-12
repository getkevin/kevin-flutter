import 'dart:convert';

import 'package:data/auth/entity/auth_token_entity.dart';
import 'package:data/auth/repository/persisted_auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fakes/fake_key_value_storage.dart';
import '../../test_data.dart';

void main() {
  late FakeKeyValueStorage keyValueStorage;
  late PersistedAuthRepository subject;

  setUp(() {
    keyValueStorage = FakeKeyValueStorage();
    subject = PersistedAuthRepository(storage: keyValueStorage);
  });

  test('Get auth token success test', () async {
    await keyValueStorage.putString(
      'linkToken',
      jsonEncode(AuthTokenEntity.fromModel(authToken).toJson()),
    );

    final result = await subject.getAuthToken('linkToken');

    expect(result, authToken);
  });

  test('Get auth token absent test', () async {
    final result = await subject.getAuthToken('linkToken');

    expect(result, null);
  });

  test('Get auth token parse error test', () async {
    await keyValueStorage.putString(
      'linkToken',
      'test',
    );

    expect(
      () async => subject.getAuthToken('linkToken'),
      throwsA(isA<Exception>()),
    );
  });

  test('Put auth token success test', () async {
    await subject.putAuthToken(
      linkToken: 'linkToken',
      authToken: authToken,
    );

    expect(
      await keyValueStorage.getString('linkToken'),
      jsonEncode(AuthTokenEntity.fromModel(authToken).toJson()),
    );
  });

  test('Remove auth token success test', () async {
    await keyValueStorage.putString(
      'linkToken',
      jsonEncode(AuthTokenEntity.fromModel(authToken).toJson()),
    );

    await subject.removeAuthToken('linkToken');

    expect(
      await keyValueStorage.getString('linkToken'),
      null,
    );
  });
}
