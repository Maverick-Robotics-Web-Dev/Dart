import 'package:equatable/equatable.dart';

class ProductFormState extends Equatable {
  final int currentIndex;

  const ProductFormState({this.currentIndex = 0});

  ProductFormState copyWith({int? currentIndex}) {
    return ProductFormState(currentIndex: currentIndex ?? this.currentIndex);
  }

  @override
  List<Object> get props => [currentIndex];
}
