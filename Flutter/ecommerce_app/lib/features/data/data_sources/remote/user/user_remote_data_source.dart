import 'package:dio/dio.dart';
import 'package:ecommerce_app/config/api_config.dart';
import 'package:ecommerce_app/core/errors/errors.dart';
import 'package:ecommerce_app/core/utils/dynamic_to_string.dart';
import 'package:ecommerce_app/features/data/data_sources/local/shared_pref.dart';
import 'package:ecommerce_app/features/data/models/auth/sign_in/sign_in_response_model.dart';
import 'package:ecommerce_app/features/data/models/users/user_model.dart';
import 'package:ecommerce_app/features/domain/entities/users/user.dart';

class UserRemoteDataSource {
  SharedPref sharedPref;
  final _dio = Dio();
  final String _urlUpdate = '${ApiConfig.apiEcommercePath}/users/';
  // final String _urlUpdate = '${ApiConfig.apiEcommerceHomePath}/users/';

  UserRemoteDataSource(this.sharedPref);

  Future<User> update(int id, User user) async {
    try {
      Map<String, dynamic> userJson = UserModel.fromEntity(user).toJson();
      print('$_urlUpdate${id.toString()}/');

      Response<dynamic> response = await _dio.patch(
        '$_urlUpdate${id.toString()}/',
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

  Future<User> updateImage(int id, User user) async {
    try {
      String urlUpdate = '$_urlUpdate${id.toString()}/';
      String token = '';
      FormData userFormData = FormData.fromMap(
        UserModel.fromEntity(user).toJson(),
      );
      final data = await sharedPref.read('user');

      if (data != null) {
        SignInResponseModel signInResponse = SignInResponseModel.fromJson(data);
        token = signInResponse.token;
      }
      print('Data: $userFormData');
      Response<dynamic> response = await _dio.patch(
        urlUpdate,
        data: userFormData,
        options: Options(headers: {'Authorization': token}),
      );
      User userResponse = response.data;

      return userResponse;
    } catch (e) {
      if (e is DioException) {
        print('DioError: ${e.response}');
        throw DioServerError(
          message: getMessageString(e.response?.data["msg"]),
        );
      } else {
        throw ServerError(message: e.toString());
      }
    }
  }
}
