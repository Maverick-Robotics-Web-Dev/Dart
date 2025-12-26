class WrongCredentials implements Exception {}

class ConnectionTimeout implements Exception {}

class InvalidToken implements Exception {}

class CustomError implements Exception {
  final String message;
  final int errorCode;

  CustomError({required this.message, required this.errorCode});
}

abstract class Failure {
  final String message;
  Failure({required this.message});
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure({required super.message});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
}
