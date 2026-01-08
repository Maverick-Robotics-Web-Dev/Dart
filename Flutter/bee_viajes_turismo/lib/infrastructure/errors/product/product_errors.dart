abstract class ProductFailure {
  final String message;
  ProductFailure({required this.message});
}

class ProductNotFound extends ProductFailure {
  ProductNotFound({required super.message});
}
