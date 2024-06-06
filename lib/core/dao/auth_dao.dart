import 'package:dio/dio.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

import 'package:product_show_case/core/dio/dio_client.dart';
import 'package:product_show_case/core/model/user/user_data.dart';
import 'package:product_show_case/core/model/registration/registration_data.dart';
import 'package:product_show_case/core/utils/db/shared_preference_helper.dart';
import 'package:product_show_case/core/utils/decoder.dart';

class AuthDAO {
  final _appUrlReg = FlavorConfig.instance.variables['baseUrl'] + 'wp-json/wp/v2/users/register';
  final _appUrlUpdateUser = FlavorConfig.instance.variables['baseUrl'] + 'wp-json/wp/v2/users/';
  final _appUrlLogin = FlavorConfig.instance.variables['baseUrl'] + '/wp-json/jwt-auth/v1/token';

  final _dio = DioClient.instance.dio;

  Future<RegistrationData?> registration({
    required String name,
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> jsonMap = {"username": name, "email": email, 'password': password};

    try {
      final response =
          await _dio.post(_appUrlReg, data: jsonMap, options: Options(contentType: Headers.jsonContentType));
      final responseModel = RegistrationData.fromJson(response.data);
      return responseModel;
    } catch (error) {
      return null;
    }
  }

  Future<UserData?> updateUser({required String name}) async {
    List<String> names = name.split(' ');
    Map<String, dynamic> jsonMap = {"first_name": names[0], "last_name": names.length > 1 ? names[1] : ""};
    try {
      String? userToken = SharedPreferenceHelper.getUserToken();

      final decodedToken = Decoder.parseJwt(userToken ?? '');
      String id = decodedToken['data']['user']['id'];
      print(id);
      final response = await _dio.post(_appUrlUpdateUser + id,
          data: jsonMap, options: Options(contentType: Headers.jsonContentType));
      final responseModel = UserData.fromMap(response.data);
      return responseModel;
    } catch (error) {
      return null;
    }
  }

  Future<UserData?> login({
    required String username,
    required String password,
  }) async {
    Map<String, dynamic> jsonMap = {"username": username, 'password': password};

    try {
      final response = await _dio.post(_appUrlLogin,
          data: jsonMap, options: Options(contentType: 'application/x-www-form-urlencoded'));
      print(response);
      final responseModel = UserData.fromMap(response.data);
      return responseModel;
    } catch (error) {
      return null;
    }
  }
}
