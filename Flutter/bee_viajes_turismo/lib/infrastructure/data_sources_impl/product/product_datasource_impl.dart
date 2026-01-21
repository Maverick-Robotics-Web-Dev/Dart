import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:bee_viajes_turismo/domain/domain.dart';
import 'package:bee_viajes_turismo/shared/shared.dart';
import 'package:dio/dio.dart';

import '../../errors/server/sever_errors.dart';
import '../../mappers/errors/dioerror_mapper.dart';
import '../../mappers/product/product_mapper.dart';

class ProductDataSourceImpl extends ProductDataSource {
  final dio = Dio(BaseOptions(baseUrl: Enviroment.apiUrl));
  final SharedPrefService _sharedPrefService = SharedPrefServiceImpl();

  @override
  Future<Product> createUpdateProduct({
    required Map<String, dynamic> productData,
  }) async {
    try {
      final String? productId = productData['id'];
      final String? token = await _sharedPrefService.getValue<String>('token');
      final String method = (productId == null) ? 'POST' : 'PATCH';
      final String url = (productId == null) ? '/post' : '/products/$productId';

      // final String method;
      // final String url;

      // if (productId == null) {
      //   method = 'POST';
      //   url = '/post';
      // } else {
      //   method = 'PATCH';
      //   url = '/products/$productId';
      // }
      productData.remove('id');

      final response = await dio.request(
        url,
        data: productData,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
          method: method,
        ),
      );

      final product = ProductMapper.fromJsonToEntity(response.data);
      return product;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<Product> getProductById({required String id}) async {
    try {
      final token = await _sharedPrefService.getValue<String>('token');

      final response = await dio.get(
        '/products/$id',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      final product = ProductMapper.fromJsonToEntity(response.data);
      return product;
    } on DioException catch (e) {
      throw DioErrorMapper.mapDioError(e);
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
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
