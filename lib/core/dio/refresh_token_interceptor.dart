import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:product_show_case/core/cubits/auth/auth_cubit.dart';
import 'package:product_show_case/core/services/navigation_service.dart';
import 'package:product_show_case/core/services/service_locator.dart';

import 'package:product_show_case/core/utils/db/shared_preference_helper.dart';
import 'package:product_show_case/core/utils/network_connections.dart';
import 'package:product_show_case/dokan_app.dart';

class RefreshTokenInterceptor extends InterceptorsWrapper {
  final Dio dioClient;
  RefreshTokenInterceptor(this.dioClient);

  final networkConnection = NetworkConnection.instance;
  final _navigationService = serviceLocator<NavigationService>();

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    NetworkConnection.checkConnection();
    String? token = SharedPreferenceHelper.getUserToken();

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
    if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
      String refreshToken = SharedPreferenceHelper.getUserToken() ?? '';
      bool refreshTokenExpired = isTokenExpired(refreshToken);

      if (refreshTokenExpired) {
        BlocProvider.of<AuthCubit>(_navigationService.navigatorKey.currentContext!).logout();
      } else {
        final response = await _retry(err.requestOptions, refreshToken);
        return handler.resolve(response!);
      }
    } else {
      DokanApp.scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(content: Text(err.response?.data['message'])));
    }
    return handler.next(err);
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
