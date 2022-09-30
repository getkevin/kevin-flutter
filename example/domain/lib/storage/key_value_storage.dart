abstract class KeyValueStorage {
  Future<void> putString(String key, String value);

  Future<String?> getString(String key);

  Future<void> remove(String key);
}
