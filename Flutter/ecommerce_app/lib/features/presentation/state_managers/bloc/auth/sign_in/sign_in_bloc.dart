import 'package:ecommerce_app/features/domain/use_cases/auth/auth_use_cases.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/auth/sign_in/sign_in_event.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/auth/sign_in/sign_in_state.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/utils/bloc_form_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  AuthUseCases authUseCases;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignInBloc(this.authUseCases) : super(SignInState()) {
    on<SignInInitEvent>(_onSignInInitEvent);
    on<EmailChangedEvent>(_onEmailChangedEvent);
    on<PasswordChangedEvent>(_onPasswordChangedEvent);
    on<SignInFormResetEvent>(_onSignInFormResetEvent);
    on<SignInSubmitEvent>(_onSignInSubmitEvent);
  }

  Future<void> _onSignInInitEvent(
    SignInInitEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onEmailChangedEvent(
    EmailChangedEvent event,
    Emitter<SignInState> emit,
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

  Future<void> _onPasswordChangedEvent(
    PasswordChangedEvent event,
    Emitter<SignInState> emit,
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

  Future<void> _onSignInFormResetEvent(
    SignInFormResetEvent event,
    Emitter<SignInState> emit,
  ) async {
    state.formKey?.currentState?.reset();
  }

  Future<void> _onSignInSubmitEvent(
    SignInSubmitEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(loadingData: 'Cargando', formKey: formKey));
    final response = await authUseCases.signIn(state.toSignIn());

    response.fold(
      (failure) => emit(state.copyWith(failure: failure, formKey: formKey)),
      (signIn) =>
          emit(state.copyWith(signInResponse: signIn, formKey: formKey)),
    );
  }
}
