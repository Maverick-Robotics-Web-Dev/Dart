abstract class DataState<T> {
  final T? data;
  final T? error;

  DataState({this.data, this.error});
}

class LoadingData extends DataState {}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(T error) : super(error: error);
}
