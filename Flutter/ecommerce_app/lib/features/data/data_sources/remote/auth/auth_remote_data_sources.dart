import 'package:dio/dio.dart';
import 'package:ecommerce_app/config/api_config.dart';
import 'package:ecommerce_app/core/errors/errors.dart';
import 'package:ecommerce_app/core/tools/dynamic_to_string.dart';
import 'package:ecommerce_app/features/data/models/auth/sign_in_response_model.dart';
import 'package:ecommerce_app/features/domain/entities/auth/sign_in/sign_in.dart';

class AuthRemoteDataSource {
  final _dio = Dio();
  final String _urlSignIn = '${ApiConfig.apiEcommercePath}/auth/sign_in/';
  // final String _urlSignIn = '${ApiConfig.apiEcommerceHomePath}/auth/sign_in/';
  // final String _urlSignUp = '${ApiConfig.apiEcommercePath}/auth/sign_up/';
  // final String _urlSignUp = '${ApiConfig.apiEcommerceHomePath}/auth/sign_up/';

  Future<SignInResponseModel> signIn(SignIn signInData) async {
    try {
      final response = await _dio.post(_urlSignIn, data: signInData);
      final SignInResponseModel signInResponse = SignInResponseModel.fromJson(
        response.data,
      );

      return signInResponse;
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
