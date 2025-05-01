import 'package:indrive_app/bloc/utils/validate_data_bloc.dart';

abstract class SignInBlocEvent {}

class SignInInitEvent extends SignInBlocEvent {}

class EmailChangedEvent extends SignInBlocEvent {
  final ValidateDataBloc email;

  EmailChangedEvent({required this.email});
}

class PasswordChangedEvent extends SignInBlocEvent {
  final ValidateDataBloc password;

  PasswordChangedEvent({required this.password});
}

class FormSubmitEvent extends SignInBlocEvent {}
