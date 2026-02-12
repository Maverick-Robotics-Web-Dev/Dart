import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:bee_viajes_turismo/domain/domain.dart';
import 'package:bee_viajes_turismo/presentation/blocs/products/product_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bee_viajes_turismo/infrastructure/infrastructure.dart';

import '../../blocs/products/forms/product_form_event.dart';
import '../../blocs/products/forms/product_form_state.dart';
import '../../presentation.dart';

class ProductMobileScreen extends StatelessWidget {
  final ThemeData appTheme;
  final Product? product;

  const ProductMobileScreen({super.key, required this.appTheme, this.product});

  @override
  Widget build(BuildContext context) {
    final bool isEdit = product != null;
    // print('PRODUCT RECEIVED IN SCREEN: ${product?.title}');
    // final bloc = context.read<ProductBloc>()
    //   ..add(LoadProduct(productId: productId));
    // final formBloc = context.read<ProductFormBloc>();
    // final productsBloc = context.read<ProductsBloc>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(create: (context) => ProductBloc()),
        BlocProvider<ProductFormBloc>(create: (context) => ProductFormBloc()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<ProductFormBloc, ProductFormState>(
            listener: (context, state) {
              if (state.isValid) {
                // final Map<String, dynamic> productData = {
                //   'title': state.title.value.isEmpty
                //       ? product?.title
                //       : state.title.value,
                //   'price': state.price.value == 0
                //       ? product?.price
                //       : state.price.value,
                //   'description': state.description.isEmpty
                //       ? product?.description
                //       : state.description,
                //   'slug': state.slug.value.isEmpty
                //       ? product?.slug
                //       : state.slug.value,
                //   'stock': state.inStock.value == 0
                //       ? product?.stock
                //       : state.inStock.value,
                //   'sizes': state.sizes.isEmpty ? product?.sizes : state.sizes,
                //   'gender': state.gender.isEmpty
                //       ? product?.gender
                //       : state.gender,
                //   'tags': state.tags.isEmpty
                //       ? product?.tags
                //       : state.tags.split(','),
                //   'images': state.images.isEmpty
                //       ? product?.images
                //       : state.images,
                // };
                final p = ProductMapper.toJson(
                  Product(
                    id: state.id ?? product?.id ?? '',
                    title: product?.title ?? state.title.value,
                    price: product?.price ?? state.price.value,
                    description: product?.description ?? state.description,
                    slug: product?.slug ?? state.slug.value,
                    stock: product?.stock ?? state.inStock.value,
                    sizes: product?.sizes ?? state.sizes,
                    gender: product?.gender ?? state.gender,
                    tags: product?.tags ?? state.tags.split(','),
                    images: product?.images ?? state.images,
                  ),
                );
                context.read<ProductBloc>().add(
                  CreateUpdateProduct(productData: p),
                );
              }
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              isEdit ? 'Editar Producto' : 'Nuevo Producto',
              style: appTheme.textTheme.headlineSmall,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.camera_alt_outlined),
              ),
            ],
          ),
          body: BlocBuilder<ProductFormBloc, ProductFormState>(
            builder: (context, state) {
              return Center(
                child:
                    // state.isLoading == true
                    // ? FullScreenLoader()
                    // :
                    ListView(
                      children: [
                        SizedBox(
                          height: 300,
                          width: 600,
                          child: ImageGallery(images: product!.images),
                        ),
                        SizedBox(height: 12),
                        Dots(images: state.images),
                        SizedBox(height: 10),
                        Center(
                          child: Text(
                            isEdit ? product!.title : 'Nuevo Producto',
                            style: appTheme.textTheme.headlineSmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 10),
                        ProductInformation(
                          appTheme: appTheme,
                          product: product,
                        ),
                      ],
                    ),
              );
            },
          ),
          floatingActionButton: BlocBuilder<ProductFormBloc, ProductFormState>(
            builder: (context, state) {
              final bloc = context.read<ProductFormBloc>();

              return FloatingActionButton(
                onPressed: () {
                  bloc.add(OnSubmitForm(product: product));
                },
                child: Icon(Icons.save_as_outlined),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ImageGallery extends StatelessWidget {
  final List<String> images;

  const ImageGallery({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ProductFormBloc>();

    return PageView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: images.length,
      onPageChanged: (index) {
        bloc.add(PageChanged(index: index));
      },
      itemBuilder: (context, index) {
        return images.isEmpty
            ? ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  'assets/img/no-image.jpg',
                  fit: BoxFit.cover,
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: SpacingTokens.lg,
                ),
                child: ClipRRect(
                  child: Image.network(images[index], fit: BoxFit.fill),
                ),
              );
      },
    );
  }
}

class Dots extends StatelessWidget {
  final List<String> images;

  const Dots({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductFormBloc, ProductFormState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              // width: state.currentIndex == index ? 14 : 8,
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: state.currentIndex == index ? Colors.black : Colors.grey,
                // color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }),
        );
      },
    );
  }
}

class ProductInformation extends StatelessWidget {
  final ThemeData appTheme;
  final Product? product;

  const ProductInformation({super.key, required this.appTheme, this.product});

  @override
  Widget build(BuildContext context) {
    final formBloc = context.read<ProductFormBloc>();
    return BlocBuilder<ProductFormBloc, ProductFormState>(
      builder: (context, state) {
        // print('STATE: $state');
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Generales', style: appTheme.textTheme.bodyLarge),
              SizedBox(height: 15),
              CustomTextFormField(
                labelText: 'Nombre',
                initialValue: product?.title,
                errorText: state.title.errorMessage,
                onChanged: (value) {
                  formBloc.add(TitleChanged(title: value));
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                labelText: 'Slug',
                initialValue: product?.slug,
                errorText: state.slug.errorMessage,
                onChanged: (value) {
                  formBloc.add(SlugChanged(slug: Slug.dirty(value: value)));
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                labelText: 'Precio',
                initialValue: product?.price.toString(),
                errorText: state.price.errorMessage,
                onChanged: (value) {
                  formBloc.add(
                    PriceChanged(
                      price: Price.dirty(value: double.tryParse(value) ?? -1),
                    ),
                  );
                },
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 15),
              Text('Extras', style: appTheme.textTheme.bodyLarge),
              SizeSelector(
                selectedSizes: product?.sizes ?? [],
                onSizesChanged: (value) {
                  formBloc.add(SizeChanged(sizes: value));
                },
              ),
              SizedBox(height: 5),
              GenderSelector(
                selectedGender: product?.gender ?? '',
                onGenderChanged: (value) {
                  formBloc.add(GenderChanged(gender: value));
                },
              ),
              SizedBox(height: 15),
              CustomTextFormField(
                labelText: 'Existencias',
                initialValue: product?.stock.toString(),
                errorText: state.inStock.errorMessage,
                onChanged: (value) {
                  formBloc.add(
                    InStockChanged(
                      inStock: Stock.dirty(value: double.tryParse(value) ?? -1),
                    ),
                  );
                },
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                maxLines: 6,
                labelText: 'Descripción',
                keyboardType: TextInputType.multiline,
                initialValue: product?.description,
                onChanged: (value) {
                  formBloc.add(DescriptionChanged(description: value));
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                maxLines: 2,
                labelText: 'Tags (Separados por coma)',
                keyboardType: TextInputType.multiline,
                initialValue: product?.tags.join(','),
                onChanged: (value) {
                  formBloc.add(TagsChanged(tags: value));
                },
              ),
              SizedBox(height: 100),
            ],
          ),
        );
      },
    );
  }
}

class SizeSelector extends StatelessWidget {
  final List<String> selectedSizes;
  final List<String> sizes = const ['XS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL'];
  final void Function(List<String> selectedSizes) onSizesChanged;

  const SizeSelector({
    super.key,
    required this.selectedSizes,
    required this.onSizesChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      emptySelectionAllowed: true,
      showSelectedIcon: false,
      segments: sizes.map((size) {
        return ButtonSegment(
          value: size,
          label: Text(size, style: const TextStyle(fontSize: 10)),
        );
      }).toList(),
      selected: Set.from(selectedSizes),
      onSelectionChanged: (newSelection) {
        onSizesChanged(List.from(newSelection));
      },
      multiSelectionEnabled: true,
    );
  }
}

class GenderSelector extends StatelessWidget {
  final String selectedGender;
  final List<String> genders = const ['men', 'women', 'kid'];
  final List<IconData> genderIcons = const [Icons.man, Icons.woman, Icons.boy];
  final void Function(String selectedGender) onGenderChanged;

  const GenderSelector({
    super.key,
    required this.selectedGender,
    required this.onGenderChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SegmentedButton(
        emptySelectionAllowed: true,
        multiSelectionEnabled: false,
        showSelectedIcon: false,
        style: const ButtonStyle(visualDensity: VisualDensity.compact),
        segments: genders.map((size) {
          return ButtonSegment(
            icon: Icon(genderIcons[genders.indexOf(size)]),
            value: size,
            label: Text(size, style: const TextStyle(fontSize: 12)),
          );
        }).toList(),
        selected: {selectedGender},
        onSelectionChanged: (newSelection) {
          onGenderChanged(newSelection.first);
        },
      ),
    );
  }
}
