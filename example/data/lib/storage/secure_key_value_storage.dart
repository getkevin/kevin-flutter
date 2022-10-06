import 'package:domain/storage/key_value_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureKeyValueStorage extends KeyValueStorage {
  final FlutterSecureStorage _storage;

  SecureKeyValueStorage({
    required FlutterSecureStorage storage,
  }) : _storage = storage;

  @override
  Future<void> putString(String key, String value) {
    return _storage.write(key: key, value: value);
  }

  @override
  Future<String?> getString(String key) {
    return _storage.read(key: key);
  }

  @override
  Future<void> remove(String key) {
    return _storage.delete(key: key);
  }
}
