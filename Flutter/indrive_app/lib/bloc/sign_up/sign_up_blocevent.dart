import 'package:indrive_app/bloc/utils/validate_data_bloc.dart';

abstract class SignUpBlocEvent {}

class SignUpInitEvent extends SignUpBlocEvent {}

class NameChangedEvent extends SignUpBlocEvent {
  final ValidateDataBloc name;

  NameChangedEvent({required this.name});
}

class LastnameChangedEvent extends SignUpBlocEvent {
  final ValidateDataBloc lastname;

  LastnameChangedEvent({required this.lastname});
}

class EmailChangedEvent extends SignUpBlocEvent {
  final ValidateDataBloc email;

  EmailChangedEvent({required this.email});
}

class PhoneChangedEvent extends SignUpBlocEvent {
  final ValidateDataBloc phone;

  PhoneChangedEvent({required this.phone});
}

class PasswordChangedEvent extends SignUpBlocEvent {
  final ValidateDataBloc password;

  PasswordChangedEvent({required this.password});
}

class ConfirmPasswordChangedEvent extends SignUpBlocEvent {
  final ValidateDataBloc confirmPassword;

  ConfirmPasswordChangedEvent({required this.confirmPassword});
}

class FormSubmitEvent extends SignUpBlocEvent {}

class FormResetEvent extends SignUpBlocEvent {}
