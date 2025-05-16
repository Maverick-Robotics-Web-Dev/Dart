import 'package:indrive_app/domain/models/auth_model.dart';
import 'package:indrive_app/domain/models/user_model.dart';

class AuthResponseModel {
  final UserModel user;
  final AuthModel auth;

  AuthResponseModel({required this.user, required this.auth});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthResponseModel(
        user: UserModel.fromJson(json["user"]),
        auth: AuthModel.fromJson(json["auth"]),
      );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "auth": auth.toJson(),
  };
}
