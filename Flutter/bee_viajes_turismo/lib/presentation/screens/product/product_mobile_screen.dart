import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:bee_viajes_turismo/domain/domain.dart';
import 'package:bee_viajes_turismo/presentation/blocs/products/product_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bee_viajes_turismo/infrastructure/infrastructure.dart';

import '../../blocs/products/forms/product_form_event.dart';
import '../../blocs/products/forms/product_form_state.dart';
import '../../blocs/products/product_state.dart';
import '../../presentation.dart';

class ProductMobileScreen extends StatelessWidget {
  final ThemeData appTheme;
  final Product? product;

  const ProductMobileScreen({super.key, required this.appTheme, this.product});

  @override
  Widget build(BuildContext context) {
    print('PRODUCT RECEIVED IN SCREEN: ${product?.title}');
    // final bloc = context.read<ProductBloc>()
    //   ..add(LoadProduct(productId: productId));
    // final formBloc = context.read<ProductFormBloc>();
    // final productsBloc = context.read<ProductsBloc>();

    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductBloc>(create: (context) => ProductBloc()),
        BlocProvider<ProductFormBloc>(
          create: (context) =>
              ProductFormBloc()..add(LoadForm(product: product)),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Editar Producto',
            style: appTheme.textTheme.headlineSmall,
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
          ],
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<ProductBloc, ProductState>(
              listener: (context, state) {
                // if (!state.isLoading) {
                //   context.read<ProductFormBloc>().add(
                //     LoadForm(product: state.product),
                //   );
                // }
                // if (state.isSaving) {
                //   formBloc.add(OnFormReset());
                //   productsBloc.add(LoadProducts());
                //   Navigator.pop(context);
                // }
              },
            ),
            BlocListener<ProductFormBloc, ProductFormState>(
              listener: (context, state) {
                if (state.isFormPosted == true) {
                  final Map<String, dynamic> product = {
                    'id': state.id!,
                    'title': state.title.value,
                    'price': state.price.value,
                    'description': state.description,
                    'slug': state.slug.value,
                    'stock': state.inStock.value,
                    'sizes': state.sizes,
                    'gender': state.gender,
                    'tags': List<String>.from(state.tags.split(',')),
                    'images': state.images,
                  };
                  // print('PRODUCT TO SUBMIT: $product');
                  context.read<ProductBloc>().add(
                    CreateUpdateProduct(productData: product),
                  );
                  // context.read<ProductBloc>().add(LoadProducts());
                  Navigator.pop(context);
                  // context.read<ProductFormBloc>().add(OnFormReset());
                }
              },
            ),
          ],
          child: BlocBuilder<ProductFormBloc, ProductFormState>(
            builder: (context, state) {
              return Center(
                child: state.isLoading
                    ? FullScreenLoader()
                    : ListView(
                        children: [
                          SizedBox(
                            height: 300,
                            width: 600,
                            child: ImageGallery(images: state.images),
                          ),
                          SizedBox(height: 12),
                          Dots(images: state.images),
                          SizedBox(height: 10),
                          Center(
                            child: Text(
                              state.title.value,
                              style: appTheme.textTheme.headlineSmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 10),
                          ProductInformation(appTheme: appTheme),
                        ],
                      ),
              );
            },
          ),
        ),
        floatingActionButton: BlocBuilder<ProductFormBloc, ProductFormState>(
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () {
                context.read<ProductFormBloc>().add(OnSubmitForm());
                // final Map<String, dynamic> product = {
                //   'id': state.id!,
                //   'title': state.title.value,
                //   'price': state.price.value,
                //   'description': state.description,
                //   'slug': state.slug.value,
                //   'stock': state.inStock.value,
                //   'sizes': state.sizes,
                //   'gender': state.gender,
                //   'tags': state.tags.split(','),
                //   'images': state.images,
                // };
                // context.read<ProductBloc>().add(
                //   CreateUpdateProduct(productData: product),
                // );
              },
              child: Icon(Icons.save_as_outlined),
            );
          },
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

  const ProductInformation({super.key, required this.appTheme});

  @override
  Widget build(BuildContext context) {
    final formBloc = context.read<ProductFormBloc>();
    return BlocBuilder<ProductFormBloc, ProductFormState>(
      builder: (context, state) {
        print('BUILDING FORM WITH STATE: ${state.title.value}');
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Generales', style: appTheme.textTheme.bodyLarge),
              SizedBox(height: 15),
              CustomTextFormField(
                labelText: 'Nombre',
                initialValue: state.title.value,
                errorText: state.title.errorMessage,
                onChanged: (value) {
                  formBloc.add(
                    TitleChanged(title: ProducName.dirty(value: value)),
                  );
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                labelText: 'Slug',
                initialValue: state.slug.value,
                errorText: state.slug.errorMessage,
                onChanged: (value) {
                  formBloc.add(SlugChanged(slug: Slug.dirty(value: value)));
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                labelText: 'Precio',
                initialValue: state.price.value.toString(),
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
                selectedSizes: state.sizes,
                onSizesChanged: (value) {
                  formBloc.add(SizeChanged(sizes: value));
                },
              ),
              SizedBox(height: 5),
              GenderSelector(
                selectedGender: state.gender,
                onGenderChanged: (value) {
                  formBloc.add(GenderChanged(gender: value));
                },
              ),
              SizedBox(height: 15),
              CustomTextFormField(
                labelText: 'Existencias',
                initialValue: state.inStock.value.toString(),
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
                initialValue: state.description,
                onChanged: (value) {
                  formBloc.add(DescriptionChanged(description: value));
                },
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                maxLines: 2,
                labelText: 'Tags (Separados por coma)',
                keyboardType: TextInputType.multiline,
                initialValue: state.tags,
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
