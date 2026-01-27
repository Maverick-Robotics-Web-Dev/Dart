import 'package:bee_viajes_turismo/domain/domain.dart';
import 'package:bee_viajes_turismo/infrastructure/infrastructure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository = ProductRepositoryImpl();

  ProductBloc() : super(ProductState.initial()) {
    on<LoadProduct>(_onLoadProduct);
    on<LoadProducts>(_onLoadProducts);
    on<CreateUpdateProduct>(_onCreateUpdateProduct);
  }

  Future<void> _onLoadProduct(
    LoadProduct event,
    Emitter<ProductState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
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
      final list = [...state.products];
      print('PRODUCT LIST BEFORE: $list');
      final product = await productRepository.createUpdateProduct(
        productData: event.productData,
      );

      final isProductInList = state.products.any((p) => p.id == product.id);
      final updatedProducts = state.products
          .map((p) => p.id == product.id ? product : p)
          .toList();

      emit(state.copyWith(products: updatedProducts));
    } catch (e) {
      print('ERROR MINE: ${e.toString()}');
    }
  }

  Future _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    if (state.isLastPage || state.isLoading) return;

    emit(state.copyWith(isLoading: true));
    final products = await productRepository.getProductsByPage(
      limit: state.limit,
      offset: state.offset,
    );
    // print('LOADED PRODUCTS: ${products.map((e) => e.title)}');

    if (products.isEmpty) {
      emit(state.copyWith(isLastPage: true, isLoading: false));
      return;
    }

    emit(
      state.copyWith(
        isLoading: false,
        isLastPage: false,
        offset: state.offset,
        products: products,
        // products: [...state.products, ...products]
      ),
    );
  }
}
