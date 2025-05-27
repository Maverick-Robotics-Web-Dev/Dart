abstract class ResponseResource<T> {}

class LoadingData extends ResponseResource {}

class SuccessData<T> extends ResponseResource<T> {
  final T data;
  SuccessData(this.data);
}

class ErrorData<T> extends ResponseResource<T> {
  final String data;
  ErrorData(this.data);
}
