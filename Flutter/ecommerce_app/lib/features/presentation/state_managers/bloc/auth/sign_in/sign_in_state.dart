import 'package:ecommerce_app/features/domain/entities/auth/sign_in/sign_in_response.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/utils/bloc_form_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SignInState extends Equatable {
  final BlocFormItem email;
  final BlocFormItem password;
  final String? loadingData;
  final SignInResponse? signInResponse;
  final String? errorData;
  final GlobalKey<FormState>? formKey;

  const SignInState({
    this.email = const BlocFormItem(error: 'Ingrese Email'),
    this.password = const BlocFormItem(error: 'Ingrese el password'),
    this.loadingData,
    this.signInResponse,
    this.errorData,
    this.formKey,
  });

  SignInState copyWith({
    BlocFormItem? email,
    BlocFormItem? password,
    String? loadingData,
    SignInResponse? singInResponse,
    String? errorData,
    GlobalKey<FormState>? formKey,
  }) => SignInState(
    email: email ?? this.email,
    password: password ?? this.password,
    loadingData: loadingData,
    signInResponse: singInResponse,
    errorData: errorData,
    formKey: formKey,
  );

  @override
  List<Object?> get props => [email, password];
}
