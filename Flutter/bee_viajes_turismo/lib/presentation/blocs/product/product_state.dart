import 'package:bee_viajes_turismo/domain/domain.dart';
import 'package:equatable/equatable.dart';

class ProductState extends Equatable {
  final String id;
  final Product? product;
  final bool isLoading;
  final bool isSaving;

  const ProductState({
    required this.id,
    this.product,
    this.isLoading = true,
    this.isSaving = false,
  });

  ProductState copyWith({
    String? id,
    Product? product,
    bool? isLoading,
    bool? isSaving,
  }) => ProductState(
    id: id ?? this.id,
    product: product ?? this.product,
    isLoading: isLoading ?? this.isLoading,
    isSaving: isSaving ?? this.isSaving,
  );

  @override
  List<Object?> get props => [id, product, isLoading, isSaving];
}
