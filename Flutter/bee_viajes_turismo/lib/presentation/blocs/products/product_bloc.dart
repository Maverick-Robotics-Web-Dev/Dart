import 'package:bee_viajes_turismo/domain/domain.dart';
import 'package:bee_viajes_turismo/infrastructure/infrastructure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository = ProductRepositoryImpl();

  ProductBloc() : super(ProductState.initial()) {
    on<LoadProduct>(_onLoadProduct);
    on<CreateUpdateProduct>(_onCreateUpdateProduct);
  }

  Future<void> _onLoadProduct(
    LoadProduct event,
    Emitter<ProductState> emit,
  ) async {
    try {
      final product = await productRepository.getProductById(
        id: event.productId,
      );
      emit(state.copyWith(isLoading: false, product: product));
    } catch (e) {
      print('ERROR MINE: $e');
    }
  }

  Future<void> _onCreateUpdateProduct(
    CreateUpdateProduct event,
    Emitter<ProductState> emit,
  ) async {
    try {
      final product = await productRepository.createUpdateProduct(
        productData: event.productData,
      );
      emit(state.copyWith(isSaving: true));
    } catch (e) {
      print('ERROR MINE: ${e.toString()}');
    }
  }
}
