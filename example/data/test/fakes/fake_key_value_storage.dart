import 'package:domain/storage/key_value_storage.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeKeyValueStorage extends Fake implements KeyValueStorage {
  final _storage = <String, String>{};

  @override
  Future<void> putString(String key, String value) async {
    _storage[key] = value;
  }

  @override
  Future<String?> getString(String key) async {
    return _storage[key];
  }

  @override
  Future<void> remove(String key) async {
    _storage.remove(key);
  }
}