import 'package:bee_viajes_turismo/infrastructure/infrastructure.dart';
import 'package:equatable/equatable.dart';

class ProductFormState extends Equatable {
  final bool isValid;
  final bool isFormPosted;
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
    this.isFormPosted = false,
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
    bool? isFormPosted,
    String? id,
    ProducName? title,
    Slug? slug,
    Price? price,
    List<String>? sizes,
    String? gender,
    Stock? inStock,
    String? description,
    String? tags,
    List<String>? images,
    int? currentIndex,
  }) {
    return ProductFormState(
      isValid: isValid ?? this.isValid,
      isFormPosted: isFormPosted ?? this.isFormPosted,
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      price: price ?? this.price,
      sizes: sizes ?? this.sizes,
      gender: gender ?? this.gender,
      inStock: inStock ?? this.inStock,
      description: description ?? this.description,
      tags: tags ?? this.tags,
      images: images ?? this.images,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props => [
    isValid,
    isFormPosted,
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
