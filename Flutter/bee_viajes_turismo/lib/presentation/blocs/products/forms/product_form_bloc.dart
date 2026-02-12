import 'package:bee_viajes_turismo/infrastructure/infrastructure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'product_form_event.dart';
import 'product_form_state.dart';

class ProductFormBloc extends Bloc<ProductFormEvent, ProductFormState> {
  ProductFormBloc() : super(ProductFormState.initial()) {
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
    on<OnSubmitForm>(_onFormSubmit);
    on<OnFormReset>(_onOnFormReset);
  }

  void _onPageChanged(PageChanged event, Emitter<ProductFormState> emit) {
    emit(state.copyWith(currentIndex: event.index));
  }

  void _onTitleChanged(TitleChanged event, Emitter<ProductFormState> emit) {
    final title = ProducName.dirty(value: event.title);

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
    emit(state.copyWith(sizes: event.sizes));
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

  void _onFormSubmit(OnSubmitForm event, Emitter<ProductFormState> emit) {
    final product = event.product;

    final title = state.title.value.isEmpty
        ? ProducName.dirty(value: product!.title)
        : state.title;

    final slug = state.slug.value.isEmpty
        ? Slug.dirty(value: product!.slug)
        : state.slug;

    final price = state.price.value == 0
        ? Price.dirty(value: product!.price)
        : state.price;

    final stock = state.inStock.value == 0
        ? Stock.dirty(value: product!.stock)
        : state.inStock;

    final status = Formz.validate([title, slug, price, stock]);

    emit(
      state.copyWith(
        title: title,
        slug: slug,
        price: price,
        inStock: stock,
        isValid: status,
      ),
    );
    // print('OBJECT STATE: ${state.isValid}');
    // if (!state.isValid) return;
    // emit(state.copyWith(isFormPosted: true));
    // print('OBJECT POSTED: ${state.isFormPosted}');
  }

  void _onOnFormReset(OnFormReset event, Emitter<ProductFormState> emit) {
    emit(state.copyWith(isFormPosted: false));
  }

  void _onLoadForm(LoadForm event, Emitter<ProductFormState> emit) {
    final product = event.product;

    // print('LOADING: ${state.isLoading}');

    if (product == null) return;

    emit(
      state.copyWith(
        id: product.id,
        title: ProducName.dirty(value: product.title),
        slug: Slug.dirty(value: product.slug),
        price: Price.dirty(value: product.price),
        sizes: product.sizes,
        gender: product.gender,
        inStock: Stock.dirty(value: product.stock),
        description: product.description,
        tags: product.tags.join(','),
        images: product.images,
        isValid: Formz.validate([
          ProducName.dirty(value: product.title),
          Slug.dirty(value: product.slug),
          Price.dirty(value: product.price),
          Stock.dirty(value: product.stock),
        ]),
      ),
    );
    emit(state.copyWith(isLoading: false));
    // print('FORM LOADED SUCCESSFULLY: ${state.isLoading}');
  }
}
