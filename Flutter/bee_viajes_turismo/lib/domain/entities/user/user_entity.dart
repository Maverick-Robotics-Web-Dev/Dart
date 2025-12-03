import 'package:bee_viajes_turismo/domain/entities/user/address_entity.dart';

class UserEntity {
  final int id;
  final String name;
  final String lastname;
  final String username;
  final String password;
  final String email;
  final Address address;
  final String phone;

  UserEntity({
    required this.address,
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.lastname,
    required this.phone,
  });
}
