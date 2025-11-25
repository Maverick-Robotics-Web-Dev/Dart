import 'package:e_commerce_valamy/src/domain/data_sources/product_datasource.dart';
import 'package:e_commerce_valamy/src/domain/entities/product_entity.dart';
import 'package:e_commerce_valamy/src/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDatasource productDatasource;

  ProductRepositoryImpl({required this.productDatasource});

  @override
  Future<List<ProductEntity>> getProductsByBanner(String banner) {
    return productDatasource.getProductsByBanner(banner);
  }
}
