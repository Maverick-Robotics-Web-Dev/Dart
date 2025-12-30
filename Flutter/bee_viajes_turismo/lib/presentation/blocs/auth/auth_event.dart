import 'package:bee_viajes_turismo/domain/domain.dart';
import 'package:bee_viajes_turismo/shared/shared.dart';

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
  final User user;
  final AuthStatus authStatus;
  CheckAuthStatus({required this.user, required this.authStatus});
}
