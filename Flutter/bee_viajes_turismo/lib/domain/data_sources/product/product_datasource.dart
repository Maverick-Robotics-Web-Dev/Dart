import '../../entities/product/product.dart';

abstract class ProductDataSource {
  Future<List<Product>> getProductsByPage({int limit = 10, int offset = 0});
  Future<Product> getProductById({required String id});
  Future<List<Product>> searchProductByTerm({required String term});
  Future<Product> createUpdateProduct({
    required Map<String, dynamic> productData,
  });
}
