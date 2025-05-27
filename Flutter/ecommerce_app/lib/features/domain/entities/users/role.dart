import 'package:ecommerce_app/features/data/models/users/role_model.dart';

class Role extends RoleModel {
  Role({
    required super.id,
    required super.name,
    required super.image,
    required super.route,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    route: json["route"],
  );

  factory Role.fromEntity(RoleModel role) =>
      Role(id: role.id, name: role.name, image: role.image, route: role.route);

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "route": route,
  };
}
