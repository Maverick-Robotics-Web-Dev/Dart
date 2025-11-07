import 'package:e_commerce_valamy/src/presentation/widgets/popular_products.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/product/secondary_product_card.dart';
import 'package:flutter/material.dart';

class MostPopular extends StatelessWidget {
  const MostPopular({super.key});

  @override
  Widget build(BuildContext context) {
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
            itemCount: demoPopularProducts.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsets.only(
                    left: 16.0,
                    right: index == demoPopularProducts.length - 1 ? 16.0 : 0,
                  ),
                  child: SecondaryProductCard(
                    image: demoPopularProducts[index].image,
                    brandName: demoPopularProducts[index].brandName,
                    title: demoPopularProducts[index].title,
                    price: demoPopularProducts[index].price,
                    priceAfetDiscount:
                        demoPopularProducts[index].priceAfetDiscount,
                    dicountpercent: demoPopularProducts[index].dicountpercent,
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
