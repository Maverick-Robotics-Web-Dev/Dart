import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indrive_app/bloc/utils/validate_data_bloc.dart';
import 'package:indrive_app/domain/utils/response_resource.dart';

class SignInBlocState extends Equatable {
  final ValidateDataBloc email;
  final ValidateDataBloc password;
  final ResponseResource? response;
  final GlobalKey<FormState>? formKey;

  const SignInBlocState({
    this.email = const ValidateDataBloc(error: 'Ingrese Email'),
    this.password = const ValidateDataBloc(error: 'Ingrese Contraseña'),
    this.response,
    this.formKey,
  });

  SignInBlocState copyWith({
    ValidateDataBloc? email,
    ValidateDataBloc? password,
    ResponseResource? response,
    GlobalKey<FormState>? formKey,
  }) {
    return SignInBlocState(
      email: email ?? this.email,
      password: password ?? this.password,
      response: response ?? this.response,
      formKey: formKey,
    );
  }

  @override
  List<Object?> get props => [email, password, response];
}
