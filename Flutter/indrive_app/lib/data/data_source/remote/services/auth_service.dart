// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:indrive_app/data/api/api_config.dart';
import 'package:indrive_app/domain/response_models/auth_response_model.dart';

class AuthService {
  final _dio = Dio();

  Future<AuthResponse?> signIn(String email, String password) async {
    try {
      final Object body = {'email': email, 'password': password};
      final response = await _dio.post(
        '${ApiConfig.apiIndrivePath}/auth/sign_in/',
        data: body,
      );
      AuthResponse authResponse = AuthResponse.fromJson(response.data);
      print('Data: ${authResponse.toJson()}');

      return authResponse;
    } catch (e) {
      if (e is DioException) {
        print('DioError: ${e.response?.data}');
        return e.response?.data;
      } else {
        print('Error: $e');
      }
      return null;
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
