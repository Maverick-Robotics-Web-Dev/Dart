import 'package:indrive_app/domain/models/role_model.dart';

class UserModel {
  final int? id;
  final String name;
  final String lastname;
  final String email;
  final String phone;
  final String? password;
  final String? image;
  final dynamic notificationToken;
  final List<RoleModel>? roles;

  UserModel({
    this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.phone,
    this.password,
    this.image,
    this.notificationToken,
    this.roles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["name"],
    lastname: json["lastname"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
    image: json["image"],
    notificationToken: json["notification_token"],
    roles: List<RoleModel>.from(
      json["roles"].map((x) => RoleModel.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastname": lastname,
    "email": email,
    "phone": phone,
    "image": image,
    "password": password,
    "notification_token": notificationToken,
    "roles":
        roles != null ? List<dynamic>.from(roles!.map((x) => x.toJson())) : [],
  };
}
