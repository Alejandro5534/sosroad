abstract interface class LocalStorage {
  Future<void> setPhoneNumber(String phoneNumber);
  Future<String?> getPhoneNumber();
}
