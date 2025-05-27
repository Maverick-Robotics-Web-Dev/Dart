import 'package:ecommerce_app/features/domain/entities/users/role.dart';

class RoleModel extends Role {
  RoleModel({
    required super.id,
    required super.name,
    required super.image,
    required super.route,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    route: json["route"],
  );

  factory RoleModel.fromEntity(Role role) => RoleModel(
    id: role.id,
    name: role.name,
    image: role.image,
    route: role.route,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "route": route,
  };
}
