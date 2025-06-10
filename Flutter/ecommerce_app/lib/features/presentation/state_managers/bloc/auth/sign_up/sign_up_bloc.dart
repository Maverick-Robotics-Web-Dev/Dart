import 'package:ecommerce_app/features/domain/use_cases/auth/auth_use_cases.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/auth/sign_up/sign_up_event.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/auth/sign_up/sign_up_state.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/utils/bloc_form_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  AuthUseCases authUseCases;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignUpBloc(this.authUseCases) : super(SignUpState()) {
    on<SignUpInitEvent>(_onSignUpInitEvent);
    on<NameChangedEvent>(_onNameChangedEvent);
    on<LastNameChangedEvent>(_onLastNameChangedEvent);
    on<EmailChangedEvent>(_onEmailChangedEvent);
    on<PhoneChangedEvent>(_onPhoneChangedEvent);
    on<PasswordChangedEvent>(_onPasswordChangedEvent);
    on<ConfirmPasswordChangedEvent>(_onConfirmPasswordChangedEvent);
    on<SignUpFormResetEvent>(_onSignUpFormResetEvent);
    on<SignUpSubmitEvent>(_onSignUpSubmitEvent);
  }

  Future<void> _onSignUpInitEvent(
    SignUpInitEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onNameChangedEvent(
    NameChangedEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(
      state.copyWith(
        email: BlocFormItem(
          value: event.name.value,
          error: event.name.value.isNotEmpty ? null : 'Ingrese el Nombre',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onLastNameChangedEvent(
    LastNameChangedEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(
      state.copyWith(
        email: BlocFormItem(
          value: event.lastname.value,
          error: event.lastname.value.isNotEmpty ? null : 'Ingrese el Apellido',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onEmailChangedEvent(
    EmailChangedEvent event,
    Emitter<SignUpState> emit,
  ) async {
    bool emailFormatValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(event.email.value);
    emit(
      state.copyWith(
        email: BlocFormItem(
          value: event.email.value,
          error:
              event.email.value.isNotEmpty && emailFormatValid
                  ? null
                  : 'Invalid email format',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onPhoneChangedEvent(
    PhoneChangedEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(
      state.copyWith(
        email: BlocFormItem(
          value: event.phone.value,
          error: event.phone.value.isNotEmpty ? null : 'Ingrese el Telefono',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onPasswordChangedEvent(
    PasswordChangedEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(
      state.copyWith(
        password: BlocFormItem(
          value: event.password.value,
          error:
              event.password.value.isNotEmpty &&
                      event.password.value.length >= 8
                  ? null
                  : 'Password must be at least 8 characters',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onConfirmPasswordChangedEvent(
    ConfirmPasswordChangedEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(
      state.copyWith(
        password: BlocFormItem(
          value: event.confirmPassword.value,
          error:
              event.confirmPassword.value.isNotEmpty
                  ? null
                  : 'Confirm Password',
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onSignUpFormResetEvent(
    SignUpFormResetEvent event,
    Emitter<SignUpState> emit,
  ) async {
    state.formKey?.currentState?.reset();
  }

  Future<void> _onSignUpSubmitEvent(
    SignUpSubmitEvent event,
    Emitter<SignUpState> emit,
  ) async {
    // emit(state.copyWith(loadingData: 'Cargando', formKey: formKey));
    final response = await authUseCases.signUp(state.toSignUp());

    response.fold(
      (failure) => emit(state.copyWith(failure: failure, formKey: formKey)),
      (signUp) =>
          emit(state.copyWith(signUpResponse: signUp, formKey: formKey)),
    );
  }
}
