import 'package:ecommerce_app/features/data/models/auth/sign_in_model.dart';
import 'package:ecommerce_app/features/domain/entities/users/user.dart';

class SignIn extends SignInModel {
  SignIn({required super.user, required super.token});

  factory SignIn.fromJson(Map<String, dynamic> json) =>
      SignIn(user: User.fromJson(json["user"]), token: json["token"]);

  Map<String, dynamic> toJson() => {
    "user": User.fromEntity(user).toJson(),
    "token": token,
  };
}
