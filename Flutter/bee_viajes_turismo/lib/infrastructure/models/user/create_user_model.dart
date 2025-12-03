import 'package:bee_viajes_turismo/infrastructure/models/user/address_model.dart';

class CreateUserModel {
  final String name;
  final String lastname;
  final String username;
  final String password;
  final String email;
  final Address address;
  final String phone;

  CreateUserModel({
    required this.address,
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.lastname,
    required this.phone,
  });

  CreateUserModel copyWith({
    Address? address,
    String? email,
    String? username,
    String? password,
    String? name,
    String? lastname,
    String? phone,
  }) => CreateUserModel(
    address: address ?? this.address,
    email: email ?? this.email,
    username: username ?? this.username,
    password: password ?? this.password,
    name: name ?? this.name,
    lastname: lastname ?? this.lastname,
    phone: phone ?? this.phone,
  );

  factory CreateUserModel.fromJson(Map<String, dynamic> json) =>
      CreateUserModel(
        address: Address.fromJson(json["address"]),
        email: json["email"],
        username: json["username"],
        password: json["password"],
        name: json["name"],
        lastname: json["name"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
    "address": address.toJson(),
    "email": email,
    "username": username,
    "password": password,
    "name": name,
    "lastname": lastname,
    "phone": phone,
  };
}
