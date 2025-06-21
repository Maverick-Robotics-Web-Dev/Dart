import 'package:ecommerce_app/features/domain/entities/users/user.dart';

class SignInResponse {
  User user;
  String token;

  SignInResponse({required this.user, required this.token});
}
