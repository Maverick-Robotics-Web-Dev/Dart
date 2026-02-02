import 'package:bee_viajes_turismo/infrastructure/infrastructure.dart';
import 'package:equatable/equatable.dart';

class ProductFormState extends Equatable {
  final bool isValid;
  final bool isFormPosted;
  final bool isLoading;
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
  final bool isEdit;

  const ProductFormState({
    this.id,
    required this.isValid,
    required this.isFormPosted,
    required this.isLoading,
    required this.title,
    required this.slug,
    required this.price,
    required this.sizes,
    required this.gender,
    required this.inStock,
    required this.description,
    required this.tags,
    required this.images,
    required this.currentIndex,
    required this.isEdit,
  });

  factory ProductFormState.initial() => ProductFormState(
    isValid: false,
    isFormPosted: false,
    isLoading: true,
    title: const ProducName.pure(),
    slug: const Slug.pure(),
    price: const Price.pure(),
    sizes: const [],
    gender: '',
    inStock: const Stock.pure(),
    description: '',
    tags: '',
    images: const [],
    currentIndex: 0,
    isEdit: false,
  );

  ProductFormState copyWith({
    bool? isValid,
    bool? isFormPosted,
    bool? isLoading,
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
    bool? isEdit,
  }) {
    return ProductFormState(
      isValid: isValid ?? this.isValid,
      isFormPosted: isFormPosted ?? this.isFormPosted,
      isLoading: isLoading ?? this.isLoading,
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
      isEdit: isEdit ?? this.isEdit,
    );
  }

  @override
  List<Object?> get props => [
    isValid,
    isFormPosted,
    isLoading,
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
    isEdit,
  ];
}
