import 'package:ecommerce_app/features/data/models/users/user_model.dart';
import 'package:ecommerce_app/features/domain/entities/auth/sign_in_response.dart';

class SignInResponseModel extends SignInResponse {
  SignInResponseModel({required super.user, required super.token});

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      SignInResponseModel(
        user: UserModel.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
    "user": UserModel.fromEntity(user).toJson(),
    "token": token,
  };
}
