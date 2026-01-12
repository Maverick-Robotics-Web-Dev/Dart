import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:bee_viajes_turismo/presentation/blocs/product/product_event.dart';
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
            ProductBloc(productId: '2d79d411-744c-42b9-bb76-b7d6f07af6e1')
              ..add(LoadProduct()),
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
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: images.length,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        images.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          // width: _currentIndex == index ? 14 : 8,
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            // color: _currentIndex == index ? Colors.blue : Colors.grey,
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
