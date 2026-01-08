abstract class Failure {
  final String message;
  Failure({required this.message});
}

class NetworkFailure extends Failure {
  NetworkFailure({required super.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});
}
