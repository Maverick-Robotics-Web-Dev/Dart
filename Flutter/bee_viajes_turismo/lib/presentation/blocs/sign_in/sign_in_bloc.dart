import 'package:bee_viajes_turismo/infrastructure/inputs/inputs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bee_viajes_turismo/presentation/blocs/sign_in/sign_in_event.dart';
import 'package:bee_viajes_turismo/presentation/blocs/sign_in/sign_in_state.dart';
import 'package:formz/formz.dart';

class SignInBloc extends Bloc<SignInFormEvent, SignInFormState> {
  SignInBloc() : super(SignInFormState()) {
    on<EmailChange>(_onEmailChange);
    on<PasswordChange>(_onPasswordChange);
    on<OnFormSubmit>(_onOnFormSubmit);
  }

  void _onEmailChange(EmailChange event, Emitter<SignInFormState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChange(PasswordChange event, Emitter<SignInFormState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onOnFormSubmit(OnFormSubmit event, Emitter<SignInFormState> emit) {
    emit(
      state.copyWith(
        isFormPosted: true,
        email: Email.dirty(value: state.email.value),
        password: Password.dirty(value: state.password.value),
        isValid: Formz.validate([state.email, state.password]),
      ),
    );

    if (!state.isValid) return;
    print('SUBMIT: $state');
  }
}
