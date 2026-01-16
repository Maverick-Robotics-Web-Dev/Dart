import 'package:bee_viajes_turismo/infrastructure/infrastructure.dart';
import 'package:equatable/equatable.dart';

class ProductFormState extends Equatable {
  final bool isValid;
  final String? id;
  final ProducName title;
  final Slug slug;
  final Price price;
  final List<String> sizes;
  final String gender;
  final Stock inStock;
  final String description;
  final String tags;
  final List<String> images;
  final int currentIndex;

  const ProductFormState({
    this.isValid = false,
    this.id,
    this.title = const ProducName.pure(),
    this.slug = const Slug.pure(),
    this.price = const Price.pure(),
    this.sizes = const [],
    this.gender = '',
    this.inStock = const Stock.pure(),
    this.description = '',
    this.tags = '',
    this.images = const [],
    this.currentIndex = 0,
  });

  ProductFormState copyWith({
    bool? isValid,
    String? id,
    ProducName? title,
    Slug? slug,
    Price? price,
    List<String>? size,
    String? gender,
    Stock? inStock,
    String? description,
    String? tags,
    List<String>? images,
    int? currentIndex,
  }) {
    return ProductFormState(currentIndex: currentIndex ?? this.currentIndex);
  }

  @override
  List<Object?> get props => [
    isValid,
    id,
    title,
    slug,
    price,
    sizes,
    gender,
    inStock,
    description,
    tags,
    images,
    currentIndex,
  ];
}
