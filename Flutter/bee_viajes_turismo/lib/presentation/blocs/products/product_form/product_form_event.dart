abstract class ProductFormEvent {
  const ProductFormEvent();
}

class PageChanged extends ProductFormEvent {
  final int index;

  const PageChanged({required this.index});
}
