import 'package:ecommerce_app/features/domain/entities/users/role.dart';

class User {
  final int id;
  final String name;
  final String lastname;
  final String email;
  final String phone;
  final String image;
  final dynamic notificationToken;
  final List<Role> roles;

  User({
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
