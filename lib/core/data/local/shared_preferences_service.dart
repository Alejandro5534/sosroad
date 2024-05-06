import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sosroad/core/data/local/local_storage.dart';
import 'package:sosroad/features/auth/domain/user_model.dart';

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

  Future<bool?> _getBool(String key) async {
    await _ensureInitialized();
    return _prefs?.getBool(key);
  }

  Future<void> _setBool(String key, bool value) async {
    await _ensureInitialized();
    await _prefs?.setBool(key, value);
  }

  Future<void> _ensureInitialized() async {
    if (_prefs == null) {
      await _init();
    }
  }

  @override
  Future<void> addUser(User user) async {
    await _setString(SharedPrefsKeys.userName, user.userName);
    await _setString(SharedPrefsKeys.userCellphone, user.cellphone);
  }

  @override
  Future<User?> getByUserName(String name) async {
    final String? userName = await _getString(SharedPrefsKeys.userName);
    if (userName == null) {
      return null;
    }
    if (userName != name) {
      return null;
    }
    final password = await _getString(SharedPrefsKeys.userCellphone);
    if (password == null) {
      return null;
    }

    return User(userName: userName, cellphone: password);
  }

  Future<void> setIsSigned(bool isSigned) async {
    await _setBool(SharedPrefsKeys.isSignedIn, isSigned);
  }

  Future<bool?> getIsSigned() async {
    return await _getBool(SharedPrefsKeys.isSignedIn);
  }
}
