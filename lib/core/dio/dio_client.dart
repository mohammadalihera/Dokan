import 'package:dio/dio.dart';

import 'package:product_show_case/core/dio/refresh_token_interceptor.dart';

class DioClient {
  static DioClient get instance => DioClient._internal();
  late Dio dio;

  factory DioClient() {
    return instance;
  }

  DioClient._internal() {
    dio = Dio();
    dio
      ..options.connectTimeout
      ..interceptors.clear()
      ..interceptors.add(RefreshTokenInterceptor(dio))
      ..interceptors.add(LogInterceptor(responseBody: false));
  }
}
