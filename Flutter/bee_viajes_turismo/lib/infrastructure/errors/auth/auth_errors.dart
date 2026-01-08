abstract class AuthFailure {
  final String message;
  AuthFailure({required this.message});
}

class UnauthorizedFailure extends AuthFailure {
  UnauthorizedFailure({required super.message});
}
