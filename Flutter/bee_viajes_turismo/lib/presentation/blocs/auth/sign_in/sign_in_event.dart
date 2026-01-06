import 'package:bee_viajes_turismo/infrastructure/infrastructure.dart';

abstract class SignInFormEvent {
  const SignInFormEvent();
}

class IsPostingChange extends SignInFormEvent {
  final bool isPosting;

  IsPostingChange({required this.isPosting});
}

class IsFormPostedChange extends SignInFormEvent {
  final bool isFormPosted;

  IsFormPostedChange({required this.isFormPosted});
}

class IsValidChange extends SignInFormEvent {
  final bool isValid;

  IsValidChange({required this.isValid});
}

class EmailChange extends SignInFormEvent {
  final Email email;

  EmailChange({required this.email});
}

class PasswordChange extends SignInFormEvent {
  final Password password;

  PasswordChange({required this.password});
}

class OnFormSubmit extends SignInFormEvent {
  OnFormSubmit();
}

class OnFormReset extends SignInFormEvent {
  OnFormReset();
}
