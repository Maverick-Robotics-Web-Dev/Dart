import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:bee_viajes_turismo/domain/domain.dart';
import 'package:dio/dio.dart';
import '../../infrastructure.dart';

class AuthDatasourceImpl extends AuthDataSource {
  final dio = Dio(BaseOptions(baseUrl: Enviroment.apiUrl));

  @override
  Future<User> signIn({required String email, required String password}) async {
    try {
      final response = await dio.post(
        '/auth/signin',
        data: {'email': email, 'password': password},
      );

      final user = UserMapper.fromJson(response.data);

      return user;
    } catch (e) {
      throw WrongCredentials();
    }
  }

  @override
  Future<User> checkAuthStatus({required String token}) {
    // TODO: implement checkAuthStatus
    throw UnimplementedError();
  }

  @override
  Future<User> signUp({
    required String name,
    required String lastname,
    required String username,
    required String password,
    required String email,
    required Address address,
    required String phone,
  }) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
