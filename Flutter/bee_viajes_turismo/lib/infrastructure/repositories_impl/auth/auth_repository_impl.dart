import 'package:bee_viajes_turismo/domain/domain.dart';
import 'package:bee_viajes_turismo/shared/shared.dart';

import '../../infrastructure.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource _dataSource;
  final SharedPrefService _sharedPrefService;

  AuthRepositoryImpl({
    AuthDataSource? dataSource,
    SharedPrefService? sharedPrefService,
  }) : _dataSource = dataSource ?? AuthDataSourceImpl(),
       _sharedPrefService = sharedPrefService ?? SharedPrefServiceImpl();

  @override
  Future<User> checkAuthStatus({required String token}) {
    return _dataSource.checkAuthStatus(token: token);
  }

  @override
  Future<User> signIn({required String email, required String password}) {
    return _dataSource.signIn(email: email, password: password);
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
    return _dataSource.signUp(
      name: name,
      lastname: lastname,
      username: username,
      password: password,
      email: email,
      address: address,
      phone: phone,
    );
  }

  @override
  Future<bool> signOut() async {
    return _sharedPrefService.removeValue('token');
  }
}
