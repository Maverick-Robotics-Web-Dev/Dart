import 'package:bee_viajes_turismo/domain/domain.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductDataSource dataSource;

  ProductRepositoryImpl({required this.dataSource});

  @override
  Future<Product> createUpdateProduct({
    required Map<String, dynamic> productData,
  }) {
    return dataSource.createUpdateProduct(productData: productData);
  }

  @override
  Future<Product> getProductById({required String id}) {
    return dataSource.getProductById(id: id);
  }

  @override
  Future<List<Product>> getProductsByPage({int limit = 10, int offset = 0}) {
    return dataSource.getProductsByPage(limit: limit, offset: offset);
  }

  @override
  Future<List<Product>> searchProductByTerm({required String term}) {
    return dataSource.searchProductByTerm(term: term);
  }
}
