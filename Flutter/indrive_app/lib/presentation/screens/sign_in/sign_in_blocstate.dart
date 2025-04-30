import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SignInBlocState extends Equatable {
  final String email;
  final String password;
  final GlobalKey<FormState>? formKey;

  const SignInBlocState({this.email = '', this.password = '', this.formKey});

  SignInBlocState copyWith({
    String? email,
    String? password,
    GlobalKey<FormState>? formKey,
  }) {
    return SignInBlocState(
      email: email ?? this.email,
      password: password ?? this.password,
      formKey: formKey,
    );
  }

  @override
  List<Object?> get props => [email, password];
}
