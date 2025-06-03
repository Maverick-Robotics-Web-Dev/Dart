import 'package:ecommerce_app/features/presentation/state_managers/bloc/utils/bloc_form_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SignInBlocState extends Equatable {
  final BlocFormItem email;
  final BlocFormItem password;
  final GlobalKey<FormState>? formKey;

  const SignInBlocState({
    this.email = const BlocFormItem(error: 'Ingrese Email'),
    this.password = const BlocFormItem(error: 'Ingrese el password'),
    this.formKey,
  });

  SignInBlocState copyWith(
    BlocFormItem? email,
    BlocFormItem? password,
    GlobalKey<FormState>? formKey,
  ) => SignInBlocState(
    email: email ?? this.email,
    password: password ?? this.password,
    formKey: formKey,
  );

  @override
  List<Object?> get props => [email, password];
}
