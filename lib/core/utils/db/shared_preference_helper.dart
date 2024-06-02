import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static SharedPreferenceHelper? _storageUtil;
  static SharedPreferences? _preferences;
  static const String _userToken = 'token';
  static const String _userRefreshToken = 'refresh_token';

  static Future<SharedPreferenceHelper?> getInstance() async {
    if (_storageUtil == null) {
      var secureStorage = SharedPreferenceHelper._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil;
  }

  SharedPreferenceHelper._();
  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String? getUserToken() {
    if (_preferences == null) return null;
    return _preferences!.getString(_userToken);
  }

  static String? getRefreshToken() {
    if (_preferences == null) return null;
    return _preferences!.getString(_userRefreshToken);
  }

  static Future<bool> setUserToken(String? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_userToken, value ?? "");
  }

  static Future<bool> setRefreshToken(String? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_userRefreshToken, value ?? "");
  }
}
