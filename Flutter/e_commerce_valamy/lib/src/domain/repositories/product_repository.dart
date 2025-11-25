import 'package:e_commerce_valamy/src/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProductsByBanner(String banner);
}
