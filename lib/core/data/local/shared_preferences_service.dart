import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sosroad/core/data/local/local_storage.dart';

import 'shared_prefs_keys.dart';

part 'shared_preferences_service.g.dart';

@riverpod
SharedPrefsService sharedPreferences(SharedPreferencesRef ref) {
  return SharedPrefsService();
}

class SharedPrefsService implements LocalStorage {
  static final SharedPrefsService _instance = SharedPrefsService._internal();
  SharedPreferences? _prefs;

  factory SharedPrefsService() {
    return _instance;
  }

  SharedPrefsService._internal() {
    _init();
  }

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<String?> _getString(String key) async {
    await _ensureInitialized();
    return _prefs?.getString(key);
  }

  Future<void> _setString(String key, String value) async {
    await _ensureInitialized();
    await _prefs?.setString(key, value);
  }

  Future<void> _ensureInitialized() async {
    if (_prefs == null) {
      await _init();
    }
  }

  @override
  Future<void> setPhoneNumber(String userCellphone) async {
    await _setString(SharedPrefsKeys.userCellphone, userCellphone);
  }

  @override
  Future<String?> getPhoneNumber() async {
    final String? userCellphone =
        await _getString(SharedPrefsKeys.userCellphone);

    return userCellphone;
  }

  Future<void> setToken(String token) async {
    await _setString(SharedPrefsKeys.token, token);
  }

  Future<String?> getToken() async {
    return await _getString(SharedPrefsKeys.token);
  }
}
