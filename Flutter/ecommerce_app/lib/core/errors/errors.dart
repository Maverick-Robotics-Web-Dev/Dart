// abstract class Error {}

// class DioError implements Error {
//   final String errorMessage;

//   DioError(this.errorMessage);
// }

class DioServerError implements Exception {
  final String message;

  DioServerError({required this.message});
}

class ServerError implements Exception {
  final String message;

  ServerError({required this.message});
}
