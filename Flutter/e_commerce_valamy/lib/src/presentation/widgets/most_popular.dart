import 'package:e_commerce_valamy/config/routes/routes.dart';
import 'package:e_commerce_valamy/src/presentation/providers/products_provider.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/product/secondary_product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MostPopular extends StatelessWidget {
  const MostPopular({super.key});

  @override
  Widget build(BuildContext context) {
    final productsProvider = context.watch<ProductsProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16.0 / 2),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Most popular",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // While loading use 👇
        // SeconderyProductsSkelton(),
        SizedBox(
          height: 114,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            // Find demoPopularProducts on models/ProductModel.dart
            itemCount: productsProvider.popularProducts.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsets.only(
                    left: 16.0,
                    right:
                        index == productsProvider.popularProducts.length - 1
                            ? 16.0
                            : 0,
                  ),
                  child: SecondaryProductCard(
                    image: productsProvider.popularProducts[index].image,
                    brandName:
                        productsProvider.popularProducts[index].brandName,
                    title: productsProvider.popularProducts[index].title,
                    price: productsProvider.popularProducts[index].price,
                    priceAfetDiscount:
                        productsProvider
                            .popularProducts[index]
                            .priceAfetDiscount,
                    dicountpercent:
                        productsProvider.popularProducts[index].dicountpercent,
                    press: () {
                      Navigator.pushNamed(
                        context,
                        productScreenRoute,
                        arguments: index.isEven,
                      );
                    },
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
