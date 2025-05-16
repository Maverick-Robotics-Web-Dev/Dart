import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_app/bloc/sign_in/sign_in_blocevent.dart';
import 'package:indrive_app/bloc/sign_in/sign_in_blocstate.dart';
import 'package:indrive_app/bloc/utils/validate_data_bloc.dart';
import 'package:indrive_app/domain/use_cases/auth/auth_use_cases.dart';
import 'package:indrive_app/domain/utils/response_resource.dart';

class SignInBloc extends Bloc<SignInBlocEvent, SignInBlocState> {
  AuthUseCases authUseCases;
  final formKey = GlobalKey<FormState>();

  SignInBloc(this.authUseCases) : super(SignInBlocState()) {
    on<SignInInitEvent>((event, emit) {
      emit(state.copyWith(formKey: formKey));
    });

    on<EmailChangedEvent>((event, emit) {
      emit(
        state.copyWith(
          email: ValidateDataBloc(
            value: event.email.value,
            error: event.email.value.isEmpty ? 'Ingrese Email' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<PasswordChangedEvent>((event, emit) {
      emit(
        state.copyWith(
          password: ValidateDataBloc(
            value: event.password.value,
            error:
                event.password.value.isEmpty
                    ? 'Ingrese Contraseña'
                    : event.password.value.length < 5
                    ? 'La contraseña debe tener al menos 5 caracteres'
                    : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<FormSubmitEvent>((event, emit) async {
      print('Email: ${state.email.value}');
      print('Password: ${state.password.value}');
      emit(state.copyWith(response: LoadingData(), formKey: formKey));
      ResponseResource response = await authUseCases.signIn.run(
        state.email.value,
        state.password.value,
      );
      emit(state.copyWith(response: response, formKey: formKey));
    });
  }
}
