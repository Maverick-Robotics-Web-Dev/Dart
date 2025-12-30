import 'package:shared_preferences/shared_preferences.dart';

import 'shared_pref_service.dart';

class SharedPrefServiceImpl extends SharedPrefService {
  Future<SharedPreferences> getSharedPrefs() async =>
      await SharedPreferences.getInstance();

  @override
  Future<T?> getValue<T>(String key) async {
    final prefs = await SharedPreferences.getInstance();

    switch (T) {
      case const (int):
        return prefs.getInt(key) as T?;

      case const (String):
        return prefs.getString(key) as T?;

      default:
        throw UnimplementedError(
          'SET not implemented for type ${T.runtimeType}',
        );
    }
  }

  @override
  Future<bool> removeValue(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }

  @override
  Future<void> setValue<T>(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();

    switch (T) {
      case const (int):
        prefs.setInt(key, value as int);
        break;

      case const (String):
        prefs.setString(key, value as String);
        break;

      default:
        throw UnimplementedError(
          'SET not implemented for type ${T.runtimeType}',
        );
    }
  }
}
