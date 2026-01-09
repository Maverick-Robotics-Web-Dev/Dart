import 'package:bee_viajes_turismo/presentation/blocs/product/product_event.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/product/product_bloc.dart';
import '../../blocs/product/product_state.dart';
import '../../widgets/full_screen_loader.dart';

class ProductMobileScreen extends StatelessWidget {
  final ThemeData appTheme;

  const ProductMobileScreen({super.key, required this.appTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Producto'),
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
        create: (context) =>
            ProductBloc(productId: '019c88d5-0246-47b3-85cb-623b3819a688')
              ..add(LoadProduct()),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            return Center(
              child: state.isLoading
                  ? FullScreenLoader()
                  : ListView(
                      children: [
                        SizedBox(
                          height: 250,
                          width: 600,
                          child: ImageGallery(images: state.product!.images),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Text(
                            state.product!.title,
                            style: TextStyle(fontSize: 26),
                            textAlign: TextAlign.center,
                          ),
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
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: PageController(viewportFraction: 0.7),
      children: images.isEmpty
          ? [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.asset(
                  'assets/img/no-image.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ]
          : images.map((e) {
              return ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.network(e, fit: BoxFit.cover),
              );
            }).toList(),
    );
  }
}
