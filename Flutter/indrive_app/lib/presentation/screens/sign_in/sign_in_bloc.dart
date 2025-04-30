import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_app/presentation/screens/sign_in/sign_in_blocevent.dart';
import 'package:indrive_app/presentation/screens/sign_in/sign_in_blocstate.dart';

class SignInBloc extends Bloc<SignInBlocEvent, SignInBlocState> {
  final formKey = GlobalKey<FormState>();

  SignInBloc() : super(SignInBlocState()) {
    on<SignInInitEvent>((event, emit) {
      emit(state.copyWith(formKey: formKey));
    });

    on<EmailChangedEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });

    on<PasswordChangedEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });

    on<FormSubmitEvent>((event, emit) {
      print('Email: ${state.email}');
      print('Password: ${state.password}');
    });
  }
}
