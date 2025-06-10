import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/domain/entities/auth/sign_in/sign_in.dart';
import 'package:ecommerce_app/features/domain/entities/auth/sign_in/sign_in_response.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/utils/bloc_form_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SignInState extends Equatable {
  final BlocFormItem email;
  final BlocFormItem password;
  final String? loadingData;
  final SignInResponse? signInResponse;
  final Failure? failure;
  final GlobalKey<FormState>? formKey;

  const SignInState({
    this.email = const BlocFormItem(error: 'Ingrese Email'),
    this.password = const BlocFormItem(error: 'Ingrese el password'),
    this.loadingData,
    this.signInResponse,
    this.failure,
    this.formKey,
  });

  SignIn toSignIn() => SignIn(email: email.value, password: password.value);

  SignInState copyWith({
    BlocFormItem? email,
    BlocFormItem? password,
    String? loadingData,
    SignInResponse? signInResponse,
    Failure? failure,
    GlobalKey<FormState>? formKey,
  }) => SignInState(
    email: email ?? this.email,
    password: password ?? this.password,
    loadingData: loadingData,
    signInResponse: signInResponse,
    failure: failure,
    formKey: formKey,
  );

  @override
  List<Object?> get props => [
    email,
    password,
    loadingData,
    signInResponse,
    failure,
  ];
}
