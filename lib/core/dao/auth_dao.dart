import 'package:flutter_flavor/flutter_flavor.dart';

import 'package:product_show_case/core/dio/dio_client.dart';
import 'package:product_show_case/core/model/registration/registration_response.dart';

class AuthDAO {
  final _appUrlReg = FlavorConfig.instance.variables['baseUrl'] + 'wp-json/wp/v2/users/register';

  final _dio = DioClient.instance.dio;

  Future<RegistrationResponse?> registration({
    required String name,
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> jsonMap = {"username": name, "email": email, 'password': password};

    try {
      final response = await _dio.post(_appUrlReg, data: jsonMap);
      print(response);
      final responseModel = RegistrationResponse.fromJson(response.data);
      return responseModel;
    } catch (error) {
      return null;
    }
  }
}
