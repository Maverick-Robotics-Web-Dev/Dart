import 'package:e_commerce_valamy/src/presentation/widgets/popular_products.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/product/product_card.dart';
import 'package:flutter/material.dart';

class FavoriteMobileScreen extends StatelessWidget {
  final TextTheme? textTheme;

  const FavoriteMobileScreen({super.key, this.textTheme});

  @override
  Widget build(BuildContext context) {
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
                  image: demoPopularProducts[index].image,
                  brandName: demoPopularProducts[index].brandName,
                  title: demoPopularProducts[index].title,
                  price: demoPopularProducts[index].price,
                  priceAfetDiscount:
                      demoPopularProducts[index].priceAfetDiscount,
                  dicountpercent: demoPopularProducts[index].dicountpercent,
                  press: () {
                    Navigator.pushNamed(context, 'productDetailsScreenRoute');
                  },
                );
              }, childCount: demoPopularProducts.length),
            ),
          ),
        ],
      ),
    );
  }
}
