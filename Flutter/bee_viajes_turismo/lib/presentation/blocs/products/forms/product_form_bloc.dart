import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:bee_viajes_turismo/infrastructure/infrastructure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'product_form_event.dart';
import 'product_form_state.dart';

class ProductFormBloc extends Bloc<ProductFormEvent, ProductFormState> {
  ProductFormBloc() : super(ProductFormState()) {
    on<PageChanged>(_onPageChanged);
    on<TitleChanged>(_onTitleChanged);
    on<SlugChanged>(_onSlugChanged);
    on<PriceChanged>(_onPriceChanged);
    on<InStockChanged>(_onInStockChanged);
    on<SizeChanged>(_onSizeChanged);
    on<GenderChanged>(_onGenderChanged);
    on<DescriptionChanged>(_onDescriptionChanged);
    on<TagsChanged>(_onTagsChanged);
    on<ImagesChanged>(_onImagesChanged);
    on<LoadForm>(_onLoadForm);
  }

  void _onPageChanged(PageChanged event, Emitter<ProductFormState> emit) {
    emit(state.copyWith(currentIndex: event.index));
  }

  void _onTitleChanged(TitleChanged event, Emitter<ProductFormState> emit) {
    final title = Title.dirty(value: event.title.value);

    emit(
      state.copyWith(
        title: title,
        isValid: Formz.validate([
          title,
          state.slug,
          state.price,
          state.inStock,
        ]),
      ),
    );
  }

  void _onSlugChanged(SlugChanged event, Emitter<ProductFormState> emit) {
    final slug = Slug.dirty(value: event.slug.value);

    emit(
      state.copyWith(
        slug: slug,
        isValid: Formz.validate([
          slug,
          state.title,
          state.price,
          state.inStock,
        ]),
      ),
    );
  }

  void _onPriceChanged(PriceChanged event, Emitter<ProductFormState> emit) {
    final price = Price.dirty(value: event.price.value);

    emit(
      state.copyWith(
        price: price,
        isValid: Formz.validate([
          price,
          state.title,
          state.slug,
          state.inStock,
        ]),
      ),
    );
  }

  void _onInStockChanged(InStockChanged event, Emitter<ProductFormState> emit) {
    final instock = Stock.dirty(value: event.inStock.value);

    emit(
      state.copyWith(
        inStock: instock,
        isValid: Formz.validate([
          instock,
          state.title,
          state.slug,
          state.price,
        ]),
      ),
    );
  }

  void _onSizeChanged(SizeChanged event, Emitter<ProductFormState> emit) {
    emit(state.copyWith(size: event.size));
  }

  void _onGenderChanged(GenderChanged event, Emitter<ProductFormState> emit) {
    emit(state.copyWith(gender: event.gender));
  }

  void _onDescriptionChanged(
    DescriptionChanged event,
    Emitter<ProductFormState> emit,
  ) {
    emit(state.copyWith(description: event.description));
  }

  void _onTagsChanged(TagsChanged event, Emitter<ProductFormState> emit) {
    emit(state.copyWith(tags: event.tags));
  }

  void _onImagesChanged(ImagesChanged event, Emitter<ProductFormState> emit) {
    emit(state.copyWith(images: event.images));
  }

  bool onFormSubmit() {
    if (!state.isValid) return false;

    final productData = {
      'id': state.id,
      'title': state.title.value,
      'price': state.price.value,
      'description': state.description,
      'slug': state.slug.value,
      'stock': state.inStock.value,
      'sizes': state.size,
      'gender': state.gender,
      'tags': state.tags.split(','),
      'images': state.images
          .map(
            (image) =>
                image.replaceAll('${Enviroment.apiUrl}/files/product/', ''),
          )
          .toList(),
    };
    return true;
  }

  void _onLoadForm(LoadForm event, Emitter<ProductFormState> emit) {
    emit(
      ProductFormState(
        id: event.product.id,
        title: Title.dirty(value: event.product.title),
        slug: Slug.dirty(value: event.product.slug),
        price: Price.dirty(value: event.product.price),
        size: event.product.sizes,
        gender: event.product.gender,
        inStock: Stock.dirty(value: event.product.stock),
        description: event.product.description,
        tags: event.product.tags.join(', '),
        images: event.product.images,
      ),
    );
  }
}
