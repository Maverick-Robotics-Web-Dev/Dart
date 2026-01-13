import 'package:flutter_bloc/flutter_bloc.dart';

import 'product_form_event.dart';
import 'product_form_state.dart';

class ProductFormBloc extends Bloc<ProductFormEvent, ProductFormState> {
  ProductFormBloc() : super(ProductFormState()) {
    on<PageChanged>(_onPageChanged);
  }

  void _onPageChanged(PageChanged event, Emitter<ProductFormState> emit) {
    emit(state.copyWith(currentIndex: event.index));
  }
}
