import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:bee_viajes_turismo/domain/domain.dart';
import 'package:bee_viajes_turismo/presentation/blocs/products/product_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/products/product_form/product_form_event.dart';
import '../../blocs/products/product_form/product_form_state.dart';
import '../../blocs/products/product_state.dart';
import '../../presentation.dart';

class ProductMobileScreen extends StatelessWidget {
  final ThemeData appTheme;

  const ProductMobileScreen({super.key, required this.appTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Producto', style: appTheme.textTheme.headlineSmall),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
        ],
      ),
      // body: BlocBuilder<ProductBloc, ProductState>(
      //   builder: (context, state) {
      //     return Center(
      //       child: state.isLoading
      //           ? FullScreenLoader()
      //           : ListView(
      //               children: [
      //                 SizedBox(height: 250, width: 600, child: ImageGallery()),
      //               ],
      //             ),
      //     );
      //   },
      // ),
      body: BlocProvider(
        create: (context) => ProductBloc(
          productId: '019c88d5-0246-47b3-85cb-623b3819a688',
          // productId: '1ebe1ab5-a6a7-48d6-97e1-1dbb99ae6fed',
        )..add(LoadProduct()),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            return Center(
              child: state.isLoading
                  ? FullScreenLoader()
                  : ListView(
                      children: [
                        SizedBox(
                          height: 300,
                          width: 600,
                          child: ImageGallery(images: state.product!.images),
                        ),
                        SizedBox(height: 12),
                        Dots(images: state.product!.images),
                        SizedBox(height: 10),
                        Center(
                          child: Text(
                            state.product!.title,
                            style: appTheme.textTheme.headlineSmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 10),
                        ProductInformation(
                          appTheme: appTheme,
                          product: state.product!,
                        ),
                      ],
                    ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.save_as_outlined),
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
  final Product product;

  const ProductInformation({
    super.key,
    required this.product,
    required this.appTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Generales', style: appTheme.textTheme.bodyLarge),
          SizedBox(height: 15),
          CustomTextFormField(labelText: 'Nombre', initialValue: product.title),
          SizedBox(height: 16),
          CustomTextFormField(labelText: 'Slug', initialValue: product.slug),
          SizedBox(height: 16),
          CustomTextFormField(
            labelText: 'Precio',
            initialValue: product.price.toString(),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          SizedBox(height: 15),
          Text('Extras', style: appTheme.textTheme.bodyLarge),
          SizeSelector(selectedSizes: product.sizes),
          SizedBox(height: 5),
          GenderSelector(selectedGender: product.gender),
          SizedBox(height: 15),
          CustomTextFormField(
            labelText: 'Existencias',
            initialValue: product.stock.toString(),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            maxLines: 6,
            labelText: 'Descripción',
            keyboardType: TextInputType.multiline,
            initialValue: product.description,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            maxLines: 2,
            labelText: 'Tags (Separados por coma)',
            keyboardType: TextInputType.multiline,
            initialValue: product.tags.join(', '),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}

class SizeSelector extends StatelessWidget {
  final List<String> selectedSizes;
  final List<String> sizes = const ['XS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL'];

  const SizeSelector({super.key, required this.selectedSizes});

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      showSelectedIcon: false,
      segments: sizes.map((size) {
        return ButtonSegment(
          value: size,
          label: Text(size, style: const TextStyle(fontSize: 10)),
        );
      }).toList(),
      selected: Set.from(selectedSizes),
      onSelectionChanged: (newSelection) {
        print(newSelection);
      },
      multiSelectionEnabled: true,
    );
  }
}

class GenderSelector extends StatelessWidget {
  final String selectedGender;
  final List<String> genders = const ['men', 'women', 'kid'];
  final List<IconData> genderIcons = const [Icons.man, Icons.woman, Icons.boy];

  const GenderSelector({super.key, required this.selectedGender});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SegmentedButton(
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
          print(newSelection);
        },
      ),
    );
  }
}
