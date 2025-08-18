import 'package:clean_architecture_flutter/core/constants/app_constants.dart';
import 'package:clean_architecture_flutter/core/enum/dio_method_enum.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  String get baseUrl {
    return const String.fromEnvironment('BASE_URL');
  }

  String get webSocketUrl {
    return const String.fromEnvironment('SOCKET_URL');
  }

  Future<Response> request(String endpoint, DioMethod method, {Map<String, dynamic>? param, formData}) async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          contentType: 'application/json',
          receiveTimeout: const Duration(milliseconds: apiTimeOut),
          sendTimeout: const Duration(milliseconds: apiTimeOut),
          connectTimeout: const Duration(milliseconds: apiTimeOut),
        ),
      );

      if (kDebugMode) {
        // dio.interceptors.add(PrettyDioLogger(
        //   requestHeader: true,
        //   requestBody: true,
        //   responseHeader: true,
        //   responseBody: true,
        // ));
      }

      switch (method) {
        case DioMethod.post:
          return dio.post(endpoint, data: param ?? formData);
        case DioMethod.get:
          return dio.get(endpoint, queryParameters: param);
        case DioMethod.put:
          return dio.put(endpoint, data: param ?? formData);
        case DioMethod.delete:
          return dio.delete(endpoint, data: param ?? formData);
      }
    } catch (e) {
      throw Exception('Network error');
    }
  }
}
