abstract class SignInBlocEvent {}

class SignInInitEvent extends SignInBlocEvent {}

class EmailChangedEvent extends SignInBlocEvent {
  final String email;

  EmailChangedEvent({required this.email});
}

class PasswordChangedEvent extends SignInBlocEvent {
  final String password;

  PasswordChangedEvent({required this.password});
}

class FormSubmitEvent extends SignInBlocEvent {}
