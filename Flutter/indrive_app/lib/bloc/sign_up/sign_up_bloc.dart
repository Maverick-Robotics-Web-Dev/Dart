import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_app/bloc/sign_up/sign_up_blocevent.dart';
import 'package:indrive_app/bloc/sign_up/sign_up_blocstate.dart';
import 'package:indrive_app/bloc/utils/validate_data_bloc.dart';

class SignUpBloc extends Bloc<SignUpBlocEvent, SignUpBlocState> {
  final formKey = GlobalKey<FormState>();

  SignUpBloc() : super(SignUpBlocState()) {
    on<SignUpInitEvent>((event, emit) {
      emit(state.copyWith(formKey: formKey));
    });

    on<NameChangedEvent>((event, emit) {
      emit(
        state.copyWith(
          name: ValidateDataBloc(
            value: event.name.value,
            error: event.name.value.isEmpty ? 'Ingrese el nombre' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<LastnameChangedEvent>((event, emit) {
      emit(
        state.copyWith(
          lastname: ValidateDataBloc(
            value: event.lastname.value,
            error: event.lastname.value.isEmpty ? 'Ingrese el apellido' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<EmailChangedEvent>((event, emit) {
      emit(
        state.copyWith(
          email: ValidateDataBloc(
            value: event.email.value,
            error: event.email.value.isEmpty ? 'Ingrese el correo' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<PhoneChangedEvent>((event, emit) {
      emit(
        state.copyWith(
          phone: ValidateDataBloc(
            value: event.phone.value,
            error: event.phone.value.isEmpty ? 'Ingrese el telefono' : null,
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
                    ? 'Ingrese la contraseña'
                    : event.password.value.length < 5
                    ? 'La contraseña debe tener al menos 5 caracteres'
                    : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<ConfirmPasswordChangedEvent>((event, emit) {
      emit(
        state.copyWith(
          confirmPassword: ValidateDataBloc(
            value: event.confirmPassword.value,
            error:
                event.confirmPassword.value.isEmpty
                    ? 'Confirme la contraseña'
                    : event.confirmPassword.value != state.password.value
                    ? 'Las contraseñas no coinciden'
                    : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<FormSubmitEvent>((event, emit) {
      if (state.formKey?.currentState?.validate() ?? false) {
        print('Nombre: ${state.name.value}');
        print('Apellido: ${state.lastname.value}');
        print('Email: ${state.email.value}');
        print('Telefono: ${state.phone.value}');
        print('Contraseña: ${state.password.value}');
        print('Confirmar Contraseña: ${state.confirmPassword.value}');
      } else {
        print('Formulario no válido');
      }
    });

    on<FormResetEvent>((event, emit) {
      state.formKey?.currentState?.reset();
    });
  }
}
