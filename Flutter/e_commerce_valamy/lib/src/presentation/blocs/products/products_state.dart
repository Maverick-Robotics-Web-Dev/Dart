import 'package:e_commerce_valamy/src/domain/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

class ProductsState extends Equatable {
  final List<ProductEntity> popularProducts;
  final List<ProductEntity> flashSaleProducts;
  final List<ProductEntity> bestSellersProducts;
  final List<ProductEntity> kidsProducts;

  const ProductsState({
    this.popularProducts = const [],
    this.flashSaleProducts = const [],
    this.bestSellersProducts = const [],
    this.kidsProducts = const [],
  });

  ProductsState copyWith({
    List<ProductEntity>? popularProducts,
    List<ProductEntity>? flashSaleProducts,
    List<ProductEntity>? bestSellersProducts,
    List<ProductEntity>? kidsProducts,
  }) => ProductsState(
    popularProducts: popularProducts ?? this.popularProducts,
    flashSaleProducts: flashSaleProducts ?? this.flashSaleProducts,
    bestSellersProducts: bestSellersProducts ?? this.bestSellersProducts,
    kidsProducts: kidsProducts ?? this.kidsProducts,
  );

  @override
  List<Object> get props => [
    popularProducts,
    flashSaleProducts,
    bestSellersProducts,
    kidsProducts,
  ];
}
