import 'package:ecommerce_app/features/domain/entities/users/role.dart';

class SignUp {
  final String name;
  final String lastname;
  final String email;
  final String phone;
  final String password;
  final String? image;
  final dynamic notificationToken;
  final List<Role>? roles;

  SignUp({
    required this.name,
    required this.lastname,
    required this.email,
    required this.phone,
    required this.password,
    this.image,
    this.notificationToken,
    this.roles,
  });
}
