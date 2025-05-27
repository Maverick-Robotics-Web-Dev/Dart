import 'package:ecommerce_app/features/domain/entities/users/user.dart';

class SignInResponse {
  final User user;
  final String token;

  SignInResponse({required this.user, required this.token});
}
