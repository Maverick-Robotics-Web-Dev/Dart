import 'dart:math';

import 'package:bee_viajes_turismo/domain/domain.dart';
import 'package:bee_viajes_turismo/infrastructure/infrastructure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'products_event.dart';
import 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository productRepository = ProductRepositoryImpl();

  ProductsBloc() : super(ProductsState()) {
    on<LoadProducts>(_onLoadProducts);
  }

  Future _onLoadProducts(
    LoadProducts event,
    Emitter<ProductsState> emit,
  ) async {
    if (state.isLastPage || state.isLoading) return;

    emit(state.copyWith(isLoading: true));
    final products = await productRepository.getProductsByPage(
      limit: state.limit,
      offset: state.offset,
    );
    print('LOADED PRODUCTS: ${products.map((e) => e.title)}');

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
      ),
    );
  }
}
