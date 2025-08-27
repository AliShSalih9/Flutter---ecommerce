import 'package:get_storage/get_storage.dart';

class DLocalStorage {
  static final DLocalStorage _instance = DLocalStorage._internal();

  factory DLocalStorage() {
    return _instance;
  }

  DLocalStorage._internal();

  final _storage = GetStorage();

  /// Initialize GetStorage. This should be called once at the start of your application.
  static Future<void> init() async {
    await GetStorage.init();
  }

  // Generic method to save data
  Future<void> saveData(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  // Generic method to get data
  T? getData<T>(String key) {
    return _storage.read(key);
  }

  // Generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Generic method to clear all data
  Future<void> clearAllData() async {
    await _storage.erase();
  }
}
