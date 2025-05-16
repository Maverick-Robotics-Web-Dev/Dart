class RoleModel {
  final String id;
  final String name;
  final String image;
  final String route;

  RoleModel({
    required this.id,
    required this.name,
    required this.image,
    required this.route,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    route: json["route"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "route": route,
  };
}
