import 'package:e_commerce_valamy/config/routes/routes.dart';
import 'package:e_commerce_valamy/src/presentation/providers/products_provider.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/product/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BestSellers extends StatelessWidget {
  const BestSellers({super.key});

  @override
  Widget build(BuildContext context) {
    final productsProvider =
        context.watch<ProductsProvider>()..loadBestSellersProducts();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16.0 / 2),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Best sellers",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // While loading use 👇
        // const ProductsSkelton(),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            // Find demoBestSellersProducts on models/ProductModel.dart
            itemCount: productsProvider.bestSellersProducts.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsets.only(
                    left: 16.0,
                    right:
                        index == productsProvider.bestSellersProducts.length - 1
                            ? 16.0
                            : 0,
                  ),
                  child: ProductCard(
                    image: productsProvider.bestSellersProducts[index].image,
                    brandName:
                        productsProvider.bestSellersProducts[index].brandName,
                    title: productsProvider.bestSellersProducts[index].title,
                    price: productsProvider.bestSellersProducts[index].price,
                    priceAfetDiscount:
                        productsProvider
                            .bestSellersProducts[index]
                            .priceAfetDiscount,
                    dicountpercent:
                        productsProvider
                            .bestSellersProducts[index]
                            .dicountpercent,
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
