import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:bee_viajes_turismo/domain/domain.dart';
import 'package:bee_viajes_turismo/shared/shared.dart';
import 'package:dio/dio.dart';

import '../../mappers/product/product_mapper.dart';

class ProductDataSourceImpl extends ProductDataSource {
  final dio = Dio(BaseOptions(baseUrl: Enviroment.apiUrl));
  final SharedPrefService _sharedPrefService = SharedPrefServiceImpl();

  @override
  Future<Product> createUpdateProduct({
    required Map<String, dynamic> productData,
  }) {
    // TODO: implement createUpdateProduct
    throw UnimplementedError();
  }

  @override
  Future<Product> getProductById({required String id}) {
    // TODO: implement getProductById
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProductsByPage({
    int limit = 10,
    int offset = 0,
  }) async {
    // final response=await dio.get('/products',queryParameters:{'limit':limit,'offset':offset});
    final response = await dio.get('/products?limit=$limit&offset=$offset');
    final List<Product> products = [];

    for (final product in response.data ?? []) {
      products.add(ProductMapper.fromJsonToEntity(product));
    }
    return products;
  }

  @override
  Future<List<Product>> searchProductByTerm({required String term}) {
    // TODO: implement searchProductByTerm
    throw UnimplementedError();
  }
}
