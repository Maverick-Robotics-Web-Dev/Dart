import 'package:bee_viajes_turismo/domain/domain.dart';

import '../../data_sources_impl/product/product_datasource_impl.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductDataSource _dataSource;

  ProductRepositoryImpl({ProductDataSource? dataSource})
    : _dataSource = dataSource ?? ProductDataSourceImpl();

  @override
  Future<Product> createUpdateProduct({
    required Map<String, dynamic> productData,
  }) {
    return _dataSource.createUpdateProduct(productData: productData);
  }

  @override
  Future<Product> getProductById({required String id}) {
    return _dataSource.getProductById(id: id);
  }

  @override
  Future<List<Product>> getProductsByPage({int limit = 10, int offset = 0}) {
    return _dataSource.getProductsByPage(limit: limit, offset: offset);
  }

  @override
  Future<List<Product>> searchProductByTerm({required String term}) {
    return _dataSource.searchProductByTerm(term: term);
  }
}
