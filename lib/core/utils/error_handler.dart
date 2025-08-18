import 'package:clean_architecture_flutter/core/constants/api_response.dart';
import 'package:clean_architecture_flutter/core/enum/datasource_enum.dart';
import 'package:clean_architecture_flutter/core/extensions/datasource_extensions.dart';
import 'package:dio/dio.dart';

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectTimeout.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();
    case DioExceptionType.badResponse:
      return _handleBadResponse(error);
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.connectionError.getFailure();
    default:
      return _handleDefaultError(error);
  }
}

_handleBadResponse(DioException error) {
  try {
    final code = error.response?.statusCode ?? ResponseCode.defaultError;
    String message = '';
    switch (code) {
      case ResponseCode.unauthorised:
        return DataSource.unauthorised.getFailure();
      case ResponseCode.forbidden:
        return DataSource.forbidden.getFailure();
      case ResponseCode.notFound:
        return DataSource.notFound.getFailure();

      default:
        message = _extractErrorMessage(error.response?.data);
        return Failure(code, message);
    }
  } catch (e) {
    return DataSource.defaultError.getFailure();
  }
}

_handleDefaultError(DioException error) {
  if (error.response?.statusCode == ResponseCode.noInternetConnection) {
    return DataSource.noInternetConnection.getFailure();
  } else {
    return DataSource.defaultError.getFailure();
  }
}

String _extractErrorMessage(dynamic data) {
  if (data is String) return data;
  String message = data["message"];
  return message;
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    } else {
      failure = DataSource.defaultError.getFailure();
    }
  }
}
