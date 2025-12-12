import '../../entities/user/address_entity.dart';
import '../../entities/user/user_entity.dart';

abstract class AuthRepository {
  Future<User> signIn(String email, String password);
  Future<User> signUp(
    String name,
    String lastname,
    String username,
    String password,
    String email,
    Address address,
    String phone,
  );

  Future<User> checkAuthStatus(String token);
}
