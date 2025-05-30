abstract class Failure {
  final String errorMessage;
  Failure(this.errorMessage);
}

class DioFailure extends Failure {
  DioFailure({required String errorMessage}) : super(errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure({required String errorMessage}) : super(errorMessage);
}
