import 'dart:convert';

import 'package:data/auth/entity/auth_token_entity.dart';
import 'package:domain/auth/model/auth_token.dart';
import 'package:domain/auth/repository/auth_repository.dart';
import 'package:domain/storage/key_value_storage.dart';

class PersistedAuthRepository extends AuthRepository {
  final KeyValueStorage _storage;

  PersistedAuthRepository({
    required KeyValueStorage storage,
  }) : _storage = storage;

  @override
  Future<AuthToken?> getAuthToken(linkToken) async {
    final tokenJsonString = await _storage.getString(linkToken);

    if (tokenJsonString == null) return null;

    return AuthTokenEntity.fromJson(jsonDecode(tokenJsonString)).toModel();
  }

  @override
  Future<void> putAuthToken({
    required String linkToken,
    required AuthToken authToken,
  }) {
    return _storage.putString(
      linkToken,
      jsonEncode(AuthTokenEntity.fromModel(authToken).toJson()),
    );
  }

  @override
  Future<void> removeAuthToken(linkToken) {
    return _storage.remove(linkToken);
  }
}
