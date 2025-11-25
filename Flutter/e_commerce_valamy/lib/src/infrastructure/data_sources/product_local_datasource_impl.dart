import 'package:e_commerce_valamy/src/domain/data_sources/product_datasource.dart';
import 'package:e_commerce_valamy/src/domain/entities/product_entity.dart';
import 'package:e_commerce_valamy/src/infrastructure/models/product_model.dart';
import 'package:e_commerce_valamy/src/shared/data/local_products.dart';

class ProductLocalDatasource implements ProductDatasource {
  @override
  Future<List<ProductEntity>> getProductsByBanner(String banner) async {
    await Future.delayed(Duration(seconds: 2));

    final List<ProductEntity> products =
        demoPopularProducts
            .map((product) => ProductModel.fromJson(product).toProductEntity())
            .toList();

    return products;
  }
}
