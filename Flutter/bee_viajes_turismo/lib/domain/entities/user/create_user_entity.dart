import 'address_entity.dart';

class CreateUserEntity {
  final String name;
  final String lastname;
  final String username;
  final String password;
  final String email;
  final Address address;
  final String phone;

  CreateUserEntity({
    required this.address,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.lastname,
    required this.phone,
  });
}
