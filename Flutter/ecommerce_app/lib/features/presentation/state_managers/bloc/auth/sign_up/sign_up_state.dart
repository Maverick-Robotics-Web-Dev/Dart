import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/domain/entities/auth/sign_up/sign_up_response.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/utils/bloc_form_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SignUpState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem lastname;
  final BlocFormItem email;
  final BlocFormItem phone;
  final BlocFormItem password;
  final BlocFormItem confirmPassword;
  final String? loadingData;
  final SignUpResponse? signUpResponse;
  final Failure? failure;
  final GlobalKey<FormState>? formKey;

  const SignUpState({
    this.name = const BlocFormItem(error: 'Ingrese Nombre'),
    this.lastname = const BlocFormItem(error: 'Ingrese Apellido'),
    this.email = const BlocFormItem(error: 'Ingrese Email'),
    this.phone = const BlocFormItem(error: 'Ingrese Telefono'),
    this.password = const BlocFormItem(error: 'Ingrese Contraseña'),
    this.confirmPassword = const BlocFormItem(error: 'Confirmar Contraseña'),
    this.loadingData,
    this.signUpResponse,
    this.failure,
    this.formKey,
  });

  SignUpState copyWith({
    BlocFormItem? name,
    BlocFormItem? lastname,
    BlocFormItem? email,
    BlocFormItem? phone,
    BlocFormItem? password,
    BlocFormItem? confirmPassword,
    String? loadingData,
    SignUpResponse? signUpResponse,
    Failure? failure,
    GlobalKey<FormState>? formKey,
  }) => SignUpState(
    name: name ?? this.name,
    lastname: lastname ?? this.lastname,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    password: password ?? this.password,
    confirmPassword: confirmPassword ?? this.confirmPassword,
    loadingData: loadingData,
    signUpResponse: signUpResponse,
    failure: failure,
    formKey: formKey,
  );

  @override
  List<Object?> get props => [
    name,
    lastname,
    email,
    phone,
    password,
    confirmPassword,
    loadingData,
    signUpResponse,
    failure,
  ];
}
