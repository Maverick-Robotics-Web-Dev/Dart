import 'package:bee_viajes_turismo/domain/entities/entities.dart';
import 'package:bee_viajes_turismo/infrastructure/inputs/inputs.dart';
import 'package:bee_viajes_turismo/shared/shared.dart';
import 'package:equatable/equatable.dart';

class SignUpState extends Equatable {
  final Name name;
  final LastName lastname;
  final UserName username;
  final Password password;
  final ConfirmPassword confirmPassword;
  final Email email;
  final Address address;
  final String phone;
  final FormStatus formStatus;
  final bool isValid;

  const SignUpState({
    this.name = const Name.pure(),
    this.lastname = const LastName.pure(),
    this.username = const UserName.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
    this.email = const Email.pure(),
    this.address = const Address(city: '', number: 0, street: '', zipcode: ''),
    this.phone = '',
    this.formStatus = FormStatus.invalid,
    this.isValid = false,
  });

  SignUpState copyWith({
    Name? name,
    LastName? lastname,
    UserName? username,
    Password? password,
    ConfirmPassword? confirmPassword,
    Email? email,
    Address? address,
    String? phone,
    FormStatus? formStatus,
    bool? isValid,
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
    isValid: isValid ?? this.isValid,
  );

  @override
  List<Object> get props => [
    name,
    lastname,
    username,
    password,
    confirmPassword,
    email,
    address,
    phone,
    formStatus,
    isValid,
  ];
}
