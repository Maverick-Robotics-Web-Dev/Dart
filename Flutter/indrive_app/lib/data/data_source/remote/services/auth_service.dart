import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:indrive_app/data/api/api_config.dart';

class AuthService {
  final _dio = Dio();

  Future<dynamic> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '${ApiConfig.apiIndrive}/auth/login',
        data: {'email': email, 'password': password},
      );
      print('Login successful: ${response.data}');
      return response.data;
    } catch (e) {
      print('Error: $e');
    }
  }
}
