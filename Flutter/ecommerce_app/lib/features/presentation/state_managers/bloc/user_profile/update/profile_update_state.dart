import 'dart:io';

import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/features/domain/entities/users/user.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/utils/bloc_form_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ProfileUpdateState extends Equatable {
  final int id;
  final BlocFormItem name;
  final BlocFormItem lastname;
  final BlocFormItem phone;
  final File? image;
  final String? loadingData;
  final User? user;
  final Failure? failure;
  final GlobalKey<FormState>? formKey;

  const ProfileUpdateState({
    this.id = 0,
    this.name = const BlocFormItem(error: 'Ingrese Nombre'),
    this.lastname = const BlocFormItem(error: 'Ingrese Apellido'),
    this.phone = const BlocFormItem(error: 'Ingrese Telefono'),
    this.image,
    this.loadingData,
    this.user,
    this.failure,
    this.formKey,
  });

  User toUser() => User(
    id: id,
    name: name.value,
    lastname: lastname.value,
    phone: phone.value,
    image: image,
  );

  ProfileUpdateState copyWith({
    int? id,
    BlocFormItem? name,
    BlocFormItem? lastname,
    BlocFormItem? phone,
    File? image,
    String? loadingData,
    User? user,
    Failure? failure,
    GlobalKey<FormState>? formKey,
  }) {
    return ProfileUpdateState(
      id: id ?? this.id,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      phone: phone ?? this.phone,
      image: image,
      loadingData: loadingData,
      user: user,
      failure: failure,
      formKey: formKey,
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    lastname,
    phone,
    image,
    loadingData,
    user,
    failure,
  ];
}
