import 'package:ecommerce_app/features/domain/entities/auth/sign_in/sign_in.dart';

class SignInModel extends SignIn {
  SignInModel({required super.email, required super.password});

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      SignInModel(email: json["email"], password: json["password"]);

  factory SignInModel.fromEntity(SignIn signIn) =>
      SignInModel(email: signIn.email, password: signIn.password);

  Map<String, dynamic> toJson() => {"email": email, "password": password};
}
