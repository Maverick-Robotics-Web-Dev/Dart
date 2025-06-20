import 'package:dio/dio.dart';
import 'package:ecommerce_app/config/api_config.dart';
import 'package:ecommerce_app/core/errors/errors.dart';
import 'package:ecommerce_app/core/utils/dynamic_to_string.dart';
import 'package:ecommerce_app/features/data/models/auth/sign_in/sign_in_model.dart';
import 'package:ecommerce_app/features/data/models/auth/sign_in/sign_in_response_model.dart';
import 'package:ecommerce_app/features/data/models/auth/sign_up/sign_up_model.dart';
import 'package:ecommerce_app/features/data/models/auth/sign_up/sign_up_response_model.dart';
import 'package:ecommerce_app/features/domain/entities/auth/sign_in/sign_in.dart';
import 'package:ecommerce_app/features/domain/entities/auth/sign_up/sign_up.dart';

class AuthRemoteDataSource {
  final _dio = Dio();
  final String _urlSignIn = '${ApiConfig.apiEcommercePath}/auth/sign_in/';
  final String _urlSignUp = '${ApiConfig.apiEcommercePath}/auth/sign_up/';
  // final String _urlSignIn = '${ApiConfig.apiEcommerceHomePath}/auth/sign_in/';
  // final String _urlSignUp = '${ApiConfig.apiEcommerceHomePath}/auth/sign_up/';

  Future<SignInResponseModel> signIn(SignIn signInData) async {
    try {
      Map<String, dynamic> signInJson =
          SignInModel.fromEntity(signInData).toJson();

      Response<dynamic> response = await _dio.post(
        _urlSignIn,
        data: signInJson,
        // options: Options(contentType: 'application/json'),
      );
      SignInResponseModel signInResponse = SignInResponseModel.fromJson(
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

  Future<SignUpResponseModel> signUp(SignUp signUpData) async {
    try {
      Map<String, dynamic> signUpJson =
          SignUpModel.fromEntity(signUpData).toJson();
      Response<dynamic> response = await _dio.post(
        _urlSignUp,
        data: signUpJson,
      );

      SignUpResponseModel signUpResponse = SignUpResponseModel.fromJson(
        response.data,
      );

      return signUpResponse;
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
