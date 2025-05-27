import 'package:ecommerce_app/features/data/models/users/user_model.dart';
import 'package:ecommerce_app/features/domain/entities/users/role.dart';

class User extends UserModel {
  User({
    required super.id,
    required super.name,
    required super.lastname,
    required super.email,
    required super.phone,
    required super.image,
    required super.notificationToken,
    required super.roles,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    lastname: json["lastname"],
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
    notificationToken: json["notification_token"],
    roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
  );

  factory User.fromEntity(UserModel user) => User(
    id: user.id,
    name: user.name,
    lastname: user.lastname,
    email: user.email,
    phone: user.phone,
    image: user.image,
    notificationToken: user.notificationToken,
    roles: List<Role>.from(user.roles.map((x) => Role.fromEntity(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastname": lastname,
    "email": email,
    "phone": phone,
    "image": image,
    "notification_token": notificationToken,
    "roles": List<dynamic>.from(roles.map((x) => Role.fromEntity(x).toJson())),
    // "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
  };
}
