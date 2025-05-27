import 'package:ecommerce_app/features/data/models/users/role_model.dart';

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
}
