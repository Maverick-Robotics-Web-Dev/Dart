import 'package:ecommerce_app/features/data/models/users/user_model.dart';
import 'package:ecommerce_app/features/domain/entities/auth/sign_up/sign_up_response.dart';

class SignUpResponseModel extends SignUpResponse {
  SignUpResponseModel({
    required super.ok,
    required super.msg,
    required super.user,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      SignUpResponseModel(
        ok: json["ok"],
        msg: json["msg"],
        user: UserModel.fromJson(json["data"]),
      );

  factory SignUpResponseModel.fromEntity(SignUpResponse signUpResponse) =>
      SignUpResponseModel(
        ok: signUpResponse.ok,
        msg: signUpResponse.msg,
        user: signUpResponse.user,
      );

  Map<String, dynamic> toJson() => {"ok": ok, "msg": msg, "data": user};
}
