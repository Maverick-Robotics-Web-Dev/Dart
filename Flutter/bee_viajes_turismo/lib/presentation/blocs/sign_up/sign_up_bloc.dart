import 'package:bee_viajes_turismo/infrastructure/inputs/inputs.dart';
import 'package:bee_viajes_turismo/presentation/blocs/sign_up/sign_up_event.dart';
import 'package:bee_viajes_turismo/presentation/blocs/sign_up/sign_up_state.dart';
import 'package:bee_viajes_turismo/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignUpBloc() : super(SignUpState()) {
    on<SignUpInit>(_onSignUpInit);
    on<NameChange>(_onNameChange);
    on<LastnameChange>(_onLastnameChange);
    on<UsernameChange>(_onUsernameChange);
    on<PasswordChange>(_onPasswordChange);
    on<ConfirmPasswordChange>(_onConfirmPasswordChange);
    on<EmailChange>(_onEmailChange);
    on<AddressChange>(_onAddressChange);
    on<PhoneChange>(_onPhoneChange);
    on<OnSubmit>(_onOnSubmit);
  }

  void _onSignUpInit(SignUpInit event, Emitter<SignUpState> emit) {
    emit(state.copyWith(formStatus: event.formStatus));
  }

  void _onNameChange(NameChange event, Emitter<SignUpState> emit) {
    print('NAME: ${event.name.value}');
    // final name = Name.dirty(value: event.name.value);
    emit(state.copyWith(name: event.name));
  }

  void _onLastnameChange(LastnameChange event, Emitter<SignUpState> emit) {
    emit(state.copyWith(lastname: event.lastname));
  }

  void _onUsernameChange(UsernameChange event, Emitter<SignUpState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _onPasswordChange(PasswordChange event, Emitter<SignUpState> emit) {
    print('NAME: ${event.password.value}');
    emit(state.copyWith(password: event.password));
  }

  void _onConfirmPasswordChange(
    ConfirmPasswordChange event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }

  void _onEmailChange(EmailChange event, Emitter<SignUpState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onAddressChange(AddressChange event, Emitter<SignUpState> emit) {
    emit(state.copyWith(address: event.address));
  }

  void _onPhoneChange(PhoneChange event, Emitter<SignUpState> emit) {
    emit(state.copyWith(phone: event.phone));
  }

  void _onOnSubmit(OnSubmit event, Emitter<SignUpState> emit) {
    emit(
      state.copyWith(
        formStatus: FormStatus.validating,
        password: Password.dirty(value: state.password.value),
      ),
    );
    print('SUBMIT: $state');
  }
}
