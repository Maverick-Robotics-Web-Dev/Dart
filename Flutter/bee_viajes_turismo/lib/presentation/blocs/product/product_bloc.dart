import 'package:bee_viajes_turismo/domain/domain.dart';
import 'package:bee_viajes_turismo/infrastructure/infrastructure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository = ProductRepositoryImpl();

  ProductBloc() : super(ProductState()) {
    on<LoadProducts>(_onLoadProducts);
  }

  Future _onLoadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    if (state.isLastPage || state.isLoading) return;

    emit(state.copyWith(isLoading: true));
    final products = await productRepository.getProductsByPage(
      limit: state.limit,
      offset: state.offset,
    );

    if (products.isEmpty) {
      emit(state.copyWith(isLastPage: true, isLoading: false));
      return;
    }

    emit(
      state.copyWith(
        isLoading: false,
        isLastPage: false,
        offset: state.offset + state.limit,
        products: [...state.products, ...products],
      ),
    );
  }
}
