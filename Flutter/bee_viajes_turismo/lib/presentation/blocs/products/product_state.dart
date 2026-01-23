import 'package:bee_viajes_turismo/domain/domain.dart';
import 'package:bee_viajes_turismo/infrastructure/infrastructure.dart';
import 'package:equatable/equatable.dart';

class ProductState extends Equatable {
  final Product product;
  final bool isLoading;
  final bool isSaving;
  final bool isLastPage;
  final int limit;
  final int offset;
  final List<Product> products;

  const ProductState({
    required this.product,
    required this.isLoading,
    required this.isSaving,
    required this.isLastPage,
    required this.limit,
    required this.offset,
    required this.products,
  });

  factory ProductState.initial() => ProductState(
    product: ProductMapper.empty(),
    isLoading: false,
    isSaving: false,
    isLastPage: false,
    limit: 10,
    offset: 0,
    products: const [],
  );

  ProductState copyWith({
    Product? product,
    bool? isLoading,
    bool? isSaving,
    bool? isLastPage,
    int? limit,
    int? offset,
    List<Product>? products,
  }) => ProductState(
    product: product ?? this.product,
    isLoading: isLoading ?? this.isLoading,
    isSaving: isSaving ?? this.isSaving,
    isLastPage: isLastPage ?? this.isLastPage,
    limit: limit ?? this.limit,
    offset: offset ?? this.offset,
    products: products ?? this.products,
  );

  @override
  List<Object> get props => [
    product,
    isLoading,
    isSaving,
    isLastPage,
    limit,
    offset,
    products,
  ];
}
