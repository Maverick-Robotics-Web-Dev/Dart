import 'package:dio/dio.dart';
import 'package:ecommerce_app/config/api_config.dart';
import 'package:ecommerce_app/core/errors/errors.dart';
import 'package:ecommerce_app/core/utils/dynamic_to_string.dart';
import 'package:ecommerce_app/features/data/models/users/user_model.dart';
import 'package:ecommerce_app/features/domain/entities/users/user.dart';

class UserRemoteDataSource {
  final _dio = Dio();
  final String _urlUpdate = '${ApiConfig.apiEcommercePath}/users/';
  // final String _urlUpdate = '${ApiConfig.apiEcommerceHomePath}/users/';

  Future<User> update(String id, User user) async {
    try {
      Map<String, dynamic> userJson = UserModel.fromEntity(user).toJson();

      Response<dynamic> response = await _dio.patch(
        _urlUpdate + id,
        data: userJson,
        // options: Options(contentType: 'application/json'),
      );
      User userResponse = response.data;

      return userResponse;
    } catch (e) {
      if (e is DioException) {
        throw DioServerError(
          message: getMessageString(e.response?.data["msg"]),
        );
      } else {
        throw ServerError(message: e.toString());
      }
    }
  }

  Future<User> updateImage(String id, User user) async {
    try {
      final userFormData = FormData.fromMap(
        UserModel.fromEntity(user).toJson(),
      );

      Response<dynamic> response = await _dio.patch(
        _urlUpdate + id,
        data: userFormData,
        // options: Options(contentType: 'application/json'),
      );
      User userResponse = response.data;

      return userResponse;
    } catch (e) {
      if (e is DioException) {
        throw DioServerError(
          message: getMessageString(e.response?.data["msg"]),
        );
      } else {
        throw ServerError(message: e.toString());
      }
    }
  }
}
