import 'package:e_commerce_valamy/src/domain/entities/product_entity.dart';
import 'package:e_commerce_valamy/src/infrastructure/models/product_model.dart';
import 'package:e_commerce_valamy/src/presentation/blocs/products/products_event.dart';
import 'package:e_commerce_valamy/src/presentation/blocs/products/products_state.dart';
import 'package:e_commerce_valamy/src/shared/data/local_products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  // final ProductRepository productRepository;

  ProductsBloc() : super(ProductsState()) {
    on<LoadPopularProducts>(_onLoadPopularProducts);
    on<LoadFlashSaleProducts>(_onLoadFlashSaleProducts);
    on<LoadBestSellersProducts>(_onLoadBestSellersProducts);
    on<LoadKidsProducts>(_onLoadKidsProducts);
  }

  Future<void> _onLoadPopularProducts(
    LoadPopularProducts event,
    Emitter<ProductsState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 2));

    final List<ProductEntity> products =
        demoPopularProducts
            .map((product) => ProductModel.fromJson(product).toProductEntity())
            .toList();

    emit(state.copyWith(popularProducts: products));
  }

  Future<void> _onLoadFlashSaleProducts(
    LoadFlashSaleProducts event,
    Emitter<ProductsState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 2));

    final List<ProductEntity> products =
        demoFlashSaleProducts
            .map((product) => ProductModel.fromJson(product).toProductEntity())
            .toList();

    emit(state.copyWith(flashSaleProducts: products));
  }

  Future<void> _onLoadBestSellersProducts(
    LoadBestSellersProducts event,
    Emitter<ProductsState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 2));

    final List<ProductEntity> products =
        demoBestSellersProducts
            .map((product) => ProductModel.fromJson(product).toProductEntity())
            .toList();

    emit(state.copyWith(bestSellersProducts: products));
  }

  Future<void> _onLoadKidsProducts(
    LoadKidsProducts event,
    Emitter<ProductsState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 2));

    final List<ProductEntity> products =
        demoKidsProducts
            .map((product) => ProductModel.fromJson(product).toProductEntity())
            .toList();

    emit(state.copyWith(kidsProducts: products));
  }
}
