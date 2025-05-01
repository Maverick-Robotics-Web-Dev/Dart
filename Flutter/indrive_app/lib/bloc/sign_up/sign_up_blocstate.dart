import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indrive_app/bloc/utils/validate_data_bloc.dart';

class SignUpBlocState extends Equatable {
  final ValidateDataBloc name;
  final ValidateDataBloc lastname;
  final ValidateDataBloc email;
  final ValidateDataBloc phone;
  final ValidateDataBloc password;
  final ValidateDataBloc confirmPassword;
  final GlobalKey<FormState>? formKey;

  const SignUpBlocState({
    this.name = const ValidateDataBloc(error: 'Ingrese el nombre'),
    this.lastname = const ValidateDataBloc(error: 'Ingrese el apellido'),
    this.email = const ValidateDataBloc(error: 'Ingrese el correo'),
    this.phone = const ValidateDataBloc(error: 'Ingrese el telefono'),
    this.password = const ValidateDataBloc(error: 'Ingrese la contraseña'),
    this.confirmPassword = const ValidateDataBloc(
      error: 'Confirme la contraseña',
    ),
    this.formKey,
  });

  SignUpBlocState copyWith({
    ValidateDataBloc? name,
    ValidateDataBloc? lastname,
    ValidateDataBloc? email,
    ValidateDataBloc? phone,
    ValidateDataBloc? password,
    ValidateDataBloc? confirmPassword,
    GlobalKey<FormState>? formKey,
  }) {
    return SignUpBlocState(
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      formKey: formKey,
    );
  }

  @override
  List<Object?> get props => [
    name,
    lastname,
    email,
    phone,
    password,
    confirmPassword,
  ];
}
