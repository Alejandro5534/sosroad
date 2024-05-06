import 'package:sosroad/features/auth/domain/user_model.dart';

abstract interface class LocalStorage {
  Future<void> addUser(User user);
  Future<User?> getByUserName(String name);
}
