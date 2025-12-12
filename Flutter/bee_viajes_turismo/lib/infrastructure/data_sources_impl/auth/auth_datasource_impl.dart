import 'package:bee_viajes_turismo/domain/domain.dart';

class AuthDatasourceImpl extends AuthDataSource {
  @override
  Future<User> checkAuthStatus(String token) {
    // TODO: implement checkAuthStatus
    throw UnimplementedError();
  }

  @override
  Future<User> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
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
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
