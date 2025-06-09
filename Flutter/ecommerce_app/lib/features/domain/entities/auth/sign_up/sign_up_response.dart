import 'package:ecommerce_app/features/domain/entities/users/user.dart';

class SignUpResponse {
  final String ok;
  final String msg;
  final User user;

  SignUpResponse({required this.ok, required this.msg, required this.user});
}
