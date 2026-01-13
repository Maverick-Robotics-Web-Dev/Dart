import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';

import '../../blocs/products/products_bloc.dart';
// import '../../blocs/product/product_event.dart';
import '../../blocs/products/products_state.dart';
import 'widgets/product_card.dart';

class ProductsMobileScreen extends StatefulWidget {
  final ThemeData appTheme;

  const ProductsMobileScreen({super.key, required this.appTheme});

  @override
  State<ProductsMobileScreen> createState() => _ProductsMobileScreenState();
}

class _ProductsMobileScreenState extends State<ProductsMobileScreen> {
  final ScrollController scrollController = ScrollController();

  // @override
  // void initState() {
  //   super.initState();

  //   scrollController.addListener(() {
  //     if ((scrollController.position.pixels + 400) >=
  //         scrollController.position.maxScrollExtent) {
  //       context.read<ProductBloc>().add(LoadProducts());
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   scrollController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded)),
        ],
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: MasonryGridView.count(
              // controller: scrollController,
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 35,
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return GestureDetector(
                  onTap: () =>
                      context.push('$pathProductScreenRoute/${product.id}'),
                  child: ProductCard(product: product),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Nuevo producto'),
        icon: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
