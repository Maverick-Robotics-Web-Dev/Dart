import 'package:bee_viajes_turismo/domain/domain.dart';
import 'package:bee_viajes_turismo/infrastructure/infrastructure.dart';

abstract class ProductFormEvent {
  const ProductFormEvent();
}

class PageChanged extends ProductFormEvent {
  final int index;

  const PageChanged({required this.index});
}

class TitleChanged extends ProductFormEvent {
  final ProducName title;

  TitleChanged({required this.title});
}

class SlugChanged extends ProductFormEvent {
  final Slug slug;

  SlugChanged({required this.slug});
}

class PriceChanged extends ProductFormEvent {
  final Price price;

  PriceChanged({required this.price});
}

class SizeChanged extends ProductFormEvent {
  final List<String> size;

  SizeChanged({required this.size});
}

class GenderChanged extends ProductFormEvent {
  final String gender;

  GenderChanged({required this.gender});
}

class InStockChanged extends ProductFormEvent {
  final Stock inStock;

  InStockChanged({required this.inStock});
}

class DescriptionChanged extends ProductFormEvent {
  final String description;

  DescriptionChanged({required this.description});
}

class TagsChanged extends ProductFormEvent {
  final String tags;

  TagsChanged({required this.tags});
}

class ImagesChanged extends ProductFormEvent {
  final List<String> images;

  ImagesChanged({required this.images});
}

class LoadForm extends ProductFormEvent {
  final Product product;

  LoadForm({required this.product});
}

class OnSubmit extends ProductFormEvent {
  final Map<String, dynamic> productData;

  OnSubmit({required this.productData});
}
