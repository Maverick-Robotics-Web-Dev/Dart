import 'package:bee_viajes_turismo/domain/domain.dart';

import '../../infrastructure.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({AuthDataSource? dataSource})
    : dataSource = dataSource ?? AuthDatasourceImpl();

  @override
  Future<User> checkAuthStatus(String token) {
    return dataSource.checkAuthStatus(token);
  }

  @override
  Future<User> signIn(String email, String password) {
    return dataSource.signIn(email, password);
  }

  @override
  Future<User> signUp(
    String name,
    String lastname,
    String username,
    String password,
    String email,
    Address address,
    String phone,
  ) {
    return dataSource.signUp(
      name,
      lastname,
      username,
      password,
      email,
      address,
      phone,
    );
  }
}
