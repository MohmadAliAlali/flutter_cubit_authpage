import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:task1_cubit/server/constans.dart';

Dio buildDio() {
  final dio = Dio()
    ..options = BaseOptions(
      baseUrl: AppLinks.baseUrl,
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
  dio.interceptors.addAll([
    if (!AppLinks.useMock) PrettyDioLogger(requestBody: true),
    _MockInterceptor(),
  ]);
  return dio;
}

/// Interceptor يقرأ من assets بدل الشبكة
class _MockInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler h) async {
    if (!AppLinks.useMock) return h.next(options); 

    if (options.path.contains('/users')) {
      final jsonString = await rootBundle.loadString('assets/mock_data/users.json');
      return h.resolve(
        Response(
          requestOptions: options,
          data: jsonDecode(jsonString),
          statusCode: 200,
        ),
      );
    }
    return h.reject(
      DioException(requestOptions: options, error: 'Mock route not found'),
    );
  }
}