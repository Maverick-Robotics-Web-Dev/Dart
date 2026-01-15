import 'package:bee_viajes_turismo/domain/domain.dart';
import 'package:bee_viajes_turismo/infrastructure/infrastructure.dart';
import 'package:equatable/equatable.dart';

class ProductState extends Equatable {
  final Product product;
  final bool isLoading;
  final bool isSaving;

  const ProductState({
    required this.product,
    required this.isLoading,
    required this.isSaving,
  });

  factory ProductState.initial() => ProductState(
    product: ProductMapper.empty(),
    isLoading: true,
    isSaving: false,
  );

  ProductState copyWith({Product? product, bool? isLoading, bool? isSaving}) =>
      ProductState(
        product: product ?? this.product,
        isLoading: isLoading ?? this.isLoading,
        isSaving: isSaving ?? this.isSaving,
      );

  @override
  List<Object> get props => [product, isLoading, isSaving];
}
