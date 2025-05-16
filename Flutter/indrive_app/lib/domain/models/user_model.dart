import 'package:indrive_app/domain/models/role_model.dart';

class UserModel {
  final int id;
  final String name;
  final String lastname;
  final String email;
  final String phone;
  final String image;
  final dynamic notificationToken;
  final List<RoleModel> roles;

  UserModel({
    required this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.image,
    required this.notificationToken,
    required this.roles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["name"],
    lastname: json["lastname"],
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
    notificationToken: json["notification_token"],
    roles:
        json["roles"] == null
            ? []
            : List<RoleModel>.from(
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
    "notification_token": notificationToken,
    "roles":
        roles.isEmpty ? [] : List<dynamic>.from(roles.map((x) => x.toJson())),
  };
}
