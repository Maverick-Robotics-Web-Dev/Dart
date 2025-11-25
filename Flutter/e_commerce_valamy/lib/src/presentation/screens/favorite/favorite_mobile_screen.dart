import 'package:e_commerce_valamy/src/presentation/providers/products_provider.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/product/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteMobileScreen extends StatelessWidget {
  final TextTheme? textTheme;

  const FavoriteMobileScreen({super.key, this.textTheme});

  @override
  Widget build(BuildContext context) {
    final productsProvider = context.watch<ProductsProvider>();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // While loading use 👇
          //  BookMarksSlelton(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.66,
              ),
              delegate: SliverChildBuilderDelegate((
                BuildContext context,
                int index,
              ) {
                return ProductCard(
                  image: productsProvider.popularProducts[index].image,
                  brandName: productsProvider.popularProducts[index].brandName,
                  title: productsProvider.popularProducts[index].title,
                  price: productsProvider.popularProducts[index].price,
                  priceAfetDiscount:
                      productsProvider.popularProducts[index].priceAfetDiscount,
                  dicountpercent:
                      productsProvider.popularProducts[index].dicountpercent,
                  press: () {
                    Navigator.pushNamed(context, 'productDetailsScreenRoute');
                  },
                );
              }, childCount: productsProvider.popularProducts.length),
            ),
          ),
        ],
      ),
    );
  }
}
