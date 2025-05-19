// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:indrive_app/data/api/api_config.dart';
import 'package:indrive_app/domain/models/auth_response_model.dart';
import 'package:indrive_app/domain/models/user_model.dart';
import 'package:indrive_app/domain/utils/response_resource.dart';
import 'package:indrive_app/tools/list_to_string.dart';

class AuthService {
  final _dio = Dio();
  final String _urlSignUp = '${ApiConfig.apiIndrivePath}/auth/sign_up/';

  Future<ResponseResource<AuthResponseModel>> signIn(
    String email,
    String password,
  ) async {
    try {
      final Map<String, dynamic> body = {'email': email, 'password': password};
      final response = await _dio.post(
        '${ApiConfig.apiIndrivePath}/auth/sign_in/',
        // '${ApiConfig.apiIndriveHomePath}/auth/sign_in/',
        data: body,
      );

      AuthResponseModel authResponse = AuthResponseModel.fromJson(
        response.data,
      );
      print('Data: ${authResponse.toJson()}');

      return SuccessData(authResponse);
    } catch (e) {
      if (e is DioException) {
        // print('DioError: ${e.response?.data}');
        return ErrorData(getMessageString(e.response?.data['msg']));
      } else {
        print('Error: $e');
        return ErrorData(e.toString());
      }
    }
  }

  Future<ResponseResource<AuthResponseModel>> signUp(
    UserModel userModel,
  ) async {
    try {
      final body = userModel;
      final response = await _dio.post(_urlSignUp, data: body);

      AuthResponseModel authResponse = AuthResponseModel.fromJson(
        response.data,
      );
      print('Data: ${authResponse.toJson()}');

      return SuccessData(authResponse);
    } catch (e) {
      if (e is DioException) {
        // print('DioError: ${e.response?.data}');
        return ErrorData(getMessageString(e.response?.data['msg']));
      } else {
        print('Error: $e');
        return ErrorData(e.toString());
      }
    }
  }

  // Uncomment the following code if you want to use the http package instead of Dio

  // Future<dynamic> sign_in(String email, String password) async {
  //   try {
  //     Uri url = Uri.http(ApiConfig.apiIndrive, '/indrive/api/v1/auth/sign_in/');
  //     Map<String, String> headers = {'Content-Type': 'application/json'};
  //     String body = json.encode({'email': email, 'password': password});

  //     final response = await http.post(url, headers: headers, body: body);
  //     print('Response data: ${response.body}');
  //     final data = json.decode(response.body);
  //     print('Data: $data');

  //     return data;
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }
}
