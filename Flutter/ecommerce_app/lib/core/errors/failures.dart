abstract class Failure<T> {
  final T error;
  Failure(this.error);
}

class ServerFailures<T> extends Failure<T> {
  ServerFailures({required T error}) : super(error);
}
