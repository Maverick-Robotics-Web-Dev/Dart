import 'package:bee_viajes_turismo/domain/entities/entities.dart';
import 'package:bee_viajes_turismo/shared/shared.dart';
import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  final String name;
  final String lastname;
  final String username;
  final String password;
  final String confirmPassword;
  final String email;
  final Address address;
  final String phone;
  final FormStatus formStatus;

  const SignUpState({
    this.name = '',
    this.lastname = '',
    this.username = '',
    this.password = '',
    this.confirmPassword = '',
    this.email = '',
    this.address = const Address(city: '', number: 0, street: '', zipcode: ''),
    this.phone = '',
    this.formStatus = FormStatus.invalid,
  });

  SignUpState copyWith({
    String? name,
    String? lastname,
    String? username,
    String? password,
    String? confirmPassword,
    String? email,
    Address? address,
    String? phone,
    FormStatus? formStatus,
  }) => SignUpState(
    name: name ?? this.name,
    lastname: lastname ?? this.lastname,
    username: username ?? this.username,
    password: password ?? this.password,
    confirmPassword: confirmPassword ?? this.confirmPassword,
    email: email ?? this.email,
    address: address ?? this.address,
    phone: phone ?? this.phone,
    formStatus: formStatus ?? this.formStatus,
  );

  @override
  List<Object> get props => [
    name,
    lastname,
    username,
    password,
    email,
    address,
    phone,
    formStatus,
  ];
}
