import 'package:shared_preferences/shared_preferences.dart';
import 'package:sosroad/core/data/local/local_storage.dart';
import 'package:sosroad/features/auth/domain/user_model.dart';

import 'shared_prefs_keys.dart';

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

  Future<String?> getString(String key) async {
    await _ensureInitialized();
    return _prefs?.getString(key);
  }

  Future<void> setString(String key, String value) async {
    await _ensureInitialized();
    await _prefs?.setString(key, value);
  }

  Future<void> _ensureInitialized() async {
    if (_prefs == null) {
      await _init();
    }
  }

  @override
  Future<void> addUser(User user) async {
    await setString(SharedPrefsKeys.userName, user.userName);
    await setString(SharedPrefsKeys.userPassword, user.password);
  }

  @override
  Future<User?> getByUserName(String name) async {
    final String? userName = await getString(SharedPrefsKeys.userName);
    if (userName == null) {
      return null;
    }
    if (userName != name) {
      return null;
    }
    final password = await getString(SharedPrefsKeys.userPassword);
    if (password == null) {
      return null;
    }

    return User(userName: userName, password: password);
  }
}
