abstract class AuthEvent {
  const AuthEvent();
}

class SignIn extends AuthEvent {
  final String email;
  final String password;

  SignIn({required this.email, required this.password});
}

class SignOut extends AuthEvent {
  SignOut();
}

class SignUp extends AuthEvent {
  final String email;
  final String password;

  SignUp({required this.email, required this.password});
}

class CheckAuthStatus extends AuthEvent {
  CheckAuthStatus();
}
