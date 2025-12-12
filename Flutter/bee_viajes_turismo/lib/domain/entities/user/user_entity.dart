import 'address_entity.dart';

class User {
  final int id;
  final String name;
  final String lastname;
  final String username;
  final String password;
  final String email;
  final Address address;
  final String phone;
  final List<String> roles;
  final String token;

  User({
    required this.address,
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.lastname,
    required this.phone,
    required this.roles,
    required this.token,
  });

  bool get isAdmin {
    return roles.contains('admin');
  }
}
