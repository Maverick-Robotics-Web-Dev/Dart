import 'package:ecommerce_app/features/data/models/users/role_model.dart';
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
    super.roles,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    name: json["name"],
    lastname: json["lastname"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
    image: json["image"],
    notificationToken: json["notification_token"],
    roles:
        json["roles"] != null
            ? List<RoleModel>.from(
              json["roles"].map((x) => RoleModel.fromJson(x)),
            )
            : [],
  );

  factory SignUpModel.fromEntity(SignUp signUp) => SignUpModel(
    name: signUp.name,
    lastname: signUp.lastname,
    email: signUp.email,
    phone: signUp.phone,
    password: signUp.password,
    image: signUp.image,
    notificationToken: signUp.notificationToken,
    roles:
        signUp.roles != null
            ? List<RoleModel>.from(
              signUp.roles!.map((x) => RoleModel.fromEntity(x)),
            )
            : [],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "lastname": lastname,
    "email": email,
    "phone": phone,
    "password": password,
    "image": image,
    "notification_token": notificationToken,
    "roles":
        roles != null
            ? List<dynamic>.from(
              roles!.map((x) => RoleModel.fromEntity(x).toJson()),
            )
            : [],
    // "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
  };
}
