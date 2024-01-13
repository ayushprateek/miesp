import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences? localStorage;

  static LocalStorage? _ls;

  Future<void> initLocalStorage() async {
    localStorage ??= await SharedPreferences.getInstance();
  }

  static LocalStorage? getInstance() {
    _ls ??= LocalStorage();
    return _ls;
  }

  static setString({
    required String key,
    required String value,
  }) {
    getInstance()?.localStorage?.setString(key, value);
  }

  static setBool({
    required String key,
    required bool value,
  }) {
    getInstance()?.localStorage?.setBool(key, value);
  }

  static setInt({
    required String key,
    required int value,
  }) {
    getInstance()?.localStorage?.setInt(key, value);
  }

  static String? getString({required String key}) {
    return LocalStorage.getInstance()?.localStorage?.getString(key);
  }

  static bool? getBool({required String key}) {
    return LocalStorage.getInstance()?.localStorage?.getBool(key);
  }

  static int? getInt({required String key}) {
    return LocalStorage.getInstance()?.localStorage?.getInt(key);
  }
}
