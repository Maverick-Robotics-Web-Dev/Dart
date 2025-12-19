import 'dart:async';

import 'package:bee_viajes_turismo/infrastructure/infrastructure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bee_viajes_turismo/presentation/blocs/sign_in/sign_in_event.dart';
import 'package:bee_viajes_turismo/presentation/blocs/sign_in/sign_in_state.dart';
import 'package:formz/formz.dart';

import '../auth/auth_bloc.dart';
import '../auth/auth_event.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final AuthBloc authBloc = AuthBloc();

  SignInFormBloc() : super(SignInFormState()) {
    on<EmailChange>(_onEmailChange);
    on<PasswordChange>(_onPasswordChange);
    on<OnFormSubmit>(_onOnFormSubmit);
  }

  void _onEmailChange(EmailChange event, Emitter<SignInFormState> emit) {
    final email = Email.dirty(value: event.email.value);

    emit(
      state.copyWith(
        email: email,
        // isValid: Formz.validate([email, state.password]),
      ),
    );
    // emit(
    //   state.copyWith(
    //     email: event.email,
    //     isValid: Formz.validate([state.email, state.password]),
    //   ),
    // );
  }

  void _onPasswordChange(PasswordChange event, Emitter<SignInFormState> emit) {
    final password = Password.dirty(value: event.password.value);

    emit(
      state.copyWith(
        password: password,
        // isValid: Formz.validate([state.email, password]),
      ),
    );
    // emit(
    //   state.copyWith(
    //     password: event.password,
    //     isValid: Formz.validate([state.email, state.password]),
    //   ),
    // );
  }

  void _onOnFormSubmit(OnFormSubmit event, Emitter<SignInFormState> emit) {
    final email = Email.dirty(value: state.email.value);
    final password = Password.dirty(value: state.password.value);

    emit(
      state.copyWith(
        isFormPosted: true,
        email: email,
        password: password,
        isValid: Formz.validate([email, password]),
      ),
    );

    // emit(
    //   state.copyWith(
    //     isFormPosted: true,
    //     email: state.email,
    //     password: state.password,
    //     isValid: Formz.validate([state.email, state.password]),
    //   ),
    // );

    if (!state.isValid) return;
    // print(state);
    authBloc.add(SignIn(email: email.value, password: password.value));
  }
}
