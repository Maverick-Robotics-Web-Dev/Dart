import 'package:ecommerce_app/features/data/models/users/user_model.dart';

class SignInModel {
  final UserModel user;
  final String token;

  SignInModel({required this.user, required this.token});
}
