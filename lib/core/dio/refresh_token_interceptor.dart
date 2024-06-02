import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:http/http.dart' as http;
import 'package:product_show_case/core/services/navigation_service.dart';
import 'package:product_show_case/core/services/service_locator.dart';

import 'package:product_show_case/core/utils/db/shared_preference_helper.dart';
import 'package:product_show_case/core/utils/network_connections.dart';

class RefreshTokenInterceptor extends InterceptorsWrapper {
  final Dio dioClient;
  RefreshTokenInterceptor(this.dioClient);

  final networkConnection = NetworkConnection.instance;
  final _navigationService = serviceLocator<NavigationService>();

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    NetworkConnection.checkConnection();
    String? token = SharedPreferenceHelper.getUserToken();

    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }

    options.validateStatus = (status) {
      if (status == 400 || status == 401 || status == 404) {
        return false;
      } else {
        return status! < 500;
      }
    };

    options.headers["Accept"] = "application/json";
    return handler.next(options);
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      String refreshToken = SharedPreferenceHelper.getRefreshToken() ?? '';
      bool refreshTokenExpired = isTokenExpired(refreshToken);

      if (refreshTokenExpired) {
        // TODO: We need to logout the use here
      } else {
        final updatedToken = await updateToken(refreshToken: refreshToken);
        if (updatedToken != null) {
          final response = await _retry(err.requestOptions, updatedToken);
          if (response != null) {
            return handler.resolve(response);
          }
        }
      }
    }
    return handler.next(err);
  }

  Future<String?> updateToken({required String refreshToken}) async {
    try {
      var response =
          await http.post(Uri.parse(FlavorConfig.instance.variables['baseUrl'] + '/api/account/refresh-token'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{"refresh_token": refreshToken}));

      if (response.statusCode >= 201 && response.statusCode <= 205) {
        final data = jsonDecode(response.body);
        String updatedToken = data['data']['token'];
        String updatedRefreshToken = data['data']['refresh_token'];
        await SharedPreferenceHelper.setUserToken(updatedToken);
        await SharedPreferenceHelper.setRefreshToken(updatedRefreshToken);
        return updatedToken;
      }
      return null;
    } catch (error) {
      return null;
    }
  }

  Future<Response<dynamic>?> _retry(RequestOptions requestOptions, String updatedToken) async {
    try {
      requestOptions.headers.addAll({"Authorization": "Bearer $updatedToken"});

      final options = Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
      );

      final response = await dioClient.request<dynamic>(requestOptions.path,
          data: requestOptions.data, queryParameters: requestOptions.queryParameters, options: options);

      return response;
    } catch (_) {
      return null;
    }
  }

  static bool isTokenExpired(String token) {
    try {
      return Jwt.isExpired(token);
    } catch (_) {
      return true;
    }
  }
}
