import 'package:ecommerce_app/features/data/models/users/role_model.dart';
import 'package:ecommerce_app/features/domain/entities/users/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.lastname,
    required super.email,
    required super.phone,
    required super.image,
    required super.notificationToken,
    required super.roles,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["name"],
    lastname: json["lastname"],
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
    notificationToken: json["notification_token"],
    roles: List<RoleModel>.from(
      json["roles"].map((x) => RoleModel.fromJson(x)),
    ),
  );

  factory UserModel.fromEntity(User user) => UserModel(
    id: user.id,
    name: user.name,
    lastname: user.lastname,
    email: user.email,
    phone: user.phone,
    image: user.image,
    notificationToken: user.notificationToken,
    roles: List<RoleModel>.from(user.roles.map((x) => RoleModel.fromEntity(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastname": lastname,
    "email": email,
    "phone": phone,
    "image": image,
    "notification_token": notificationToken,
    "roles": List<dynamic>.from(
      roles.map((x) => RoleModel.fromEntity(x).toJson()),
    ),
    // "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
  };
}
