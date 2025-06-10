import 'package:ecommerce_app/features/domain/entities/auth/sign_up/sign_up.dart';

class SignUpModel extends SignUp {
  SignUpModel({
    required super.name,
    required super.lastname,
    required super.email,
    required super.phone,
    required super.password,
    super.image,
    super.notificationToken,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    name: json["name"],
    lastname: json["lastname"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
    image: json["image"],
    notificationToken: json["notification_token"],
  );

  factory SignUpModel.fromEntity(SignUp signUp) => SignUpModel(
    name: signUp.name,
    lastname: signUp.lastname,
    email: signUp.email,
    phone: signUp.phone,
    password: signUp.password,
    image: signUp.image,
    notificationToken: signUp.notificationToken,
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "lastname": lastname,
    "email": email,
    "phone": phone,
    "password": password,
    "image": image,
    "notification_token": notificationToken,
  };
}
