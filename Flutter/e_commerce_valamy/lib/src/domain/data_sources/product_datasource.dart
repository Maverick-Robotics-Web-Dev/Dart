import 'package:e_commerce_valamy/src/domain/entities/product_entity.dart';

abstract class ProductDatasource {
  Future<List<ProductEntity>> getProductsByBanner(String banner);
}
