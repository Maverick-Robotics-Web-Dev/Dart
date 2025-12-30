abstract class SharedPrefService {
  Future<void> setValue<T>(String key, T value);
  Future<T?> getValue<T>(String key);
  Future<bool> removeValue(String key);
}
