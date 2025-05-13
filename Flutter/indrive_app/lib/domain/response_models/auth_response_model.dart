import 'package:indrive_app/domain/models/auth_model.dart';
import 'package:indrive_app/domain/models/user_model.dart';

class AuthResponse {
  final User user;
  final Auth auth;

  AuthResponse({required this.user, required this.auth});

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    user: User.fromJson(json["user"]),
    auth: Auth.fromJson(json["auth"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "auth": auth.toJson(),
  };
}
