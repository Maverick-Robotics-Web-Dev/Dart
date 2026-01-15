import 'package:bee_viajes_turismo/domain/domain.dart';
import 'package:bee_viajes_turismo/infrastructure/infrastructure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository = ProductRepositoryImpl();

  ProductBloc() : super(ProductState.initial()) {
    on<LoadProduct>(_onLoadProduct);
  }

  Future<void> _onLoadProduct(
    LoadProduct event,
    Emitter<ProductState> emit,
  ) async {
    try {
      final product = await productRepository.getProductById(
        id: event.productId,
      );
      print('PRODUCT: $product');
      emit(state.copyWith(isLoading: false, product: product));
    } catch (e) {
      print('ERROR MINE: $e');
    }
  }
}
