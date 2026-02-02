// import 'package:bee_viajes_turismo/infrastructure/mappers/user/address_mapper.dart';

import 'package:bee_viajes_turismo/domain/domain.dart';

class UserMapper {
  static User fromJson(Map<String, dynamic> json) => User(
    address: json['address'],
    id: json['id'],
    email: json['email'],
    username: json['username'],
    password: json['password'],
    name: json['fullName'],
    lastname: json['name'],
    phone: json['phone'],
    roles: List<String>.from(json['roles'].map((role) => role)),
    token: json['token'] ?? '',
  );

  static User empty() => User(
    id: '',
    email: '',
    username: '',
    password: '',
    name: '',
    lastname: '',
    phone: '',
    roles: [],
    token: '',
  );
}
// class UserModel {
//   final int id;
//   final String name;
//   final String lastname;
//   final String username;
//   final String password;
//   final String email;
//   final Address address;
//   final String phone;

//   UserModel({
//     required this.address,
//     required this.id,
//     required this.email,
//     required this.username,
//     required this.password,
//     required this.name,
//     required this.lastname,
//     required this.phone,
//   });

//   UserModel copyWith({
//     Address? address,
//     int? id,
//     String? email,
//     String? username,
//     String? password,
//     String? name,
//     String? lastname,
//     String? phone,
//   }) => UserModel(
//     address: address ?? this.address,
//     id: id ?? this.id,
//     email: email ?? this.email,
//     username: username ?? this.username,
//     password: password ?? this.password,
//     name: name ?? this.name,
//     lastname: lastname ?? this.lastname,
//     phone: phone ?? this.phone,
//   );

//   factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//     address: Address.fromJson(json["address"]),
//     id: json["id"],
//     email: json["email"],
//     username: json["username"],
//     password: json["password"],
//     name: json["name"],
//     lastname: json["name"],
//     phone: json["phone"],
//   );

//   Map<String, dynamic> toJson() => {
//     "address": address.toJson(),
//     "id": id,
//     "email": email,
//     "username": username,
//     "password": password,
//     "name": name,
//     "lastname": lastname,
//     "phone": phone,
//   };
// }
