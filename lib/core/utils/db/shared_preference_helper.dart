import 'package:product_show_case/core/model/user/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static SharedPreferenceHelper? _storageUtil;
  static SharedPreferences? _preferences;
  static const String _userToken = 'token';
  static final String _currentUser = 'current_user';

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

  static Future<bool> setUserToken(String? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setString(_userToken, value ?? "");
  }

  static Future<bool> setCurrentUser(UserData? user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJson = user != null ? user.toJson() : "";
    return prefs.setString(_currentUser, userJson);
  }

  static UserData? getCurrentUser() {
    if (_preferences == null) return null;
    String? userJson = _preferences!.getString(_currentUser);
    return userJson != null && userJson.isNotEmpty ? UserData.fromJson(userJson) : null;
  }
}
