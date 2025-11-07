import 'package:e_commerce_valamy/src/presentation/widgets/popular_products.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/product/product_card.dart';
import 'package:flutter/material.dart';

class BestSellers extends StatelessWidget {
  const BestSellers({super.key});

  @override
  Widget build(BuildContext context) {
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
            itemCount: demoBestSellersProducts.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsets.only(
                    left: 16.0,
                    right:
                        index == demoBestSellersProducts.length - 1 ? 16.0 : 0,
                  ),
                  child: ProductCard(
                    image: demoBestSellersProducts[index].image,
                    brandName: demoBestSellersProducts[index].brandName,
                    title: demoBestSellersProducts[index].title,
                    price: demoBestSellersProducts[index].price,
                    priceAfetDiscount:
                        demoBestSellersProducts[index].priceAfetDiscount,
                    dicountpercent:
                        demoBestSellersProducts[index].dicountpercent,
                    press: () {
                      Navigator.pushNamed(
                        context,
                        'productDetailsScreenRoute',
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
