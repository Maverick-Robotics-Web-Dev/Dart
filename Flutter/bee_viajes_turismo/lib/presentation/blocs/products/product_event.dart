abstract class ProductEvent {
  const ProductEvent();
}

class LoadProduct extends ProductEvent {
  final String productId;

  LoadProduct({required this.productId});
}

class CreateUpdateProduct extends ProductEvent {
  final Map<String, dynamic> productData;

  CreateUpdateProduct({required this.productData});
}
