import '../../entities/user/address_entity.dart';
import '../../entities/user/user_entity.dart';

abstract class AuthRepository {
  Future<User> signIn({required String email, required String password});
  Future<User> signUp({
    required String name,
    required String lastname,
    required String username,
    required String password,
    required String email,
    required Address address,
    required String phone,
  });

  Future<User> checkAuthStatus({required String token});
}
