abstract class ProductEvent {
  const ProductEvent();
}

class LoadProduct extends ProductEvent {
  final String productId;

  LoadProduct({required this.productId});
}
