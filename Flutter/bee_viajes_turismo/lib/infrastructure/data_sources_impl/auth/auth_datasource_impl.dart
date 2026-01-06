import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:bee_viajes_turismo/domain/domain.dart';
import 'package:bee_viajes_turismo/shared/shared.dart';
import 'package:dio/dio.dart';

import '../../errors/auth/auth_errors.dart';
import '../../mappers/errors/dioerror_mapper.dart';
import '../../mappers/user/user_mapper.dart';

class AuthDataSourceImpl extends AuthDataSource {
  final dio = Dio(BaseOptions(baseUrl: Enviroment.apiUrl));
  final SharedPrefService _sharedPrefService = SharedPrefServiceImpl();

  @override
  Future<User> signIn({required String email, required String password}) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );

      final user = UserMapper.fromJsonToEntity(response.data);

      return user;
    } on DioException catch (e) {
      throw DioErrorMapper.mapDioError(e);
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }

  @override
  Future<User> checkAuthStatus({required String token}) async {
    try {
      final response = await dio.get(
        '/auth/check-status',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      final user = UserMapper.fromJsonToEntity(response.data);

      return user;
    } on DioException catch (e) {
      throw DioErrorMapper.mapDioError(e);
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
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
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() {
    return _sharedPrefService.removeValue('token');
  }
}
