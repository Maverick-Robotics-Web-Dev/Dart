import 'package:ecommerce_app/features/domain/entities/auth/sign_in/sign_in.dart';
import 'package:ecommerce_app/features/domain/use_cases/auth/auth_use_cases.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/auth/sign_in/sign_in_event.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/auth/sign_in/sign_in_state.dart';
import 'package:ecommerce_app/features/presentation/state_managers/bloc/utils/bloc_form_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  AuthUseCases authUseCases;
  // final _emailController = BehaviorSubject<String>();
  // final _passwordController = BehaviorSubject<String>();

  SignInBloc(this.authUseCases) : super(SignInState()) {
    on<SignInInitEvent>(_onSignInInitEvent);
    on<EmailChangedEvent>(_onEmailChangedEvent);
    on<PasswordChangedEvent>(_onPasswordChangedEvent);
    on<SignInSubmitEvent>(_onSignInSubmitEvent);
  }

  final formKey = GlobalKey<FormState>();

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
    emit(
      state.copyWith(
        email: BlocFormItem(value: event.email.value),
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
        password: BlocFormItem(value: event.password.value),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onSignInSubmitEvent(
    SignInSubmitEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(loadingData: 'Cargando'));
    final response = await authUseCases.signIn(
      SignIn(email: state.email.value, password: state.password.value),
    );

    response.fold(
      (failure) => emit(state.copyWith(errorData: failure.errorMessage)),
      (signIn) => emit(state.copyWith(singInResponse: signIn)),
    );
  }

  // Stream<String> get emailStream => _emailController.stream;
  // Stream<String> get passwordStream => _passwordController.stream;

  // void changeEmail(String email) {
  //   if (email.isNotEmpty && !email.contains('@') && !email.contains('.')) {
  //     _emailController.sink.addError('Invalid email format');
  //   } else {
  //     _emailController.sink.add(email);
  //   }
  // }

  // void changePassword(String password) {
  //   if (password.isNotEmpty && password.length < 8) {
  //     _passwordController.sink.addError(
  //       'Password must be at least 8 characters',
  //     );
  //   } else {
  //     _passwordController.sink.add(password);
  //   }
  // }

  // Stream<bool> get validateForm =>
  //     Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);

  // void diposeForm() {
  //   changeEmail('');
  //   changePassword('');
  // }

  // signIn() async {
  //   print('E-mail: ${_emailController.value}');
  //   print('Password: ${_passwordController.value}');
  //   // final SignIn data=
  //   final response = await authUseCases.signIn(
  //     SignIn(
  //       email: _emailController.value,
  //       password: _passwordController.value,
  //     ),
  //   );

  // return response.fold(
  //   (failure) => emit(SignInFailureState(failure: failure)),
  //   (signIn) => emit(SignInSuccessState(response: signIn)),
  // );
  // }
}
