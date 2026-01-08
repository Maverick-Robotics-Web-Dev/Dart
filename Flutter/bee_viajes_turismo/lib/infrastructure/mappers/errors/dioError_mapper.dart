import 'package:dio/dio.dart';

import '../../errors/auth/auth_errors.dart';
import '../../errors/product/product_errors.dart';
import '../../errors/server/sever_errors.dart';

class DioErrorMapper {
  static dynamic mapDioError(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.connectionError) {
      return NetworkFailure(message: error.response?.data['message']);
    }

    if (error.response?.statusCode == 401) {
      return UnauthorizedFailure(message: error.response?.data['message']);
    }

    if (error.response?.statusCode == 404) {
      return ProductNotFound(message: error.response?.data['message']);
    }

    return ServerFailure(message: error.response?.data['message']);
  }
}
