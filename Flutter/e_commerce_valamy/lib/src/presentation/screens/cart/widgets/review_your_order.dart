import 'package:e_commerce_valamy/src/presentation/providers/products_provider.dart';
import 'package:e_commerce_valamy/src/presentation/screens/cart/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewYourOrder extends StatefulWidget {
  const ReviewYourOrder({super.key});

  @override
  State<ReviewYourOrder> createState() => _ReviewYourOrderState();
}

class _ReviewYourOrderState extends State<ReviewYourOrder> {
  @override
  Widget build(BuildContext context) {
    final productsProvider = context.watch<ProductsProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16 / 2),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            "Review your order",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        SizedBox(
          height: 348,
          child: ListView.builder(
            // scrollDirection: Axis.horizontal,
            // Find demoPopularProducts on models/ProductModel.dart
            itemCount: productsProvider.popularProducts.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsets.only(right: 16, left: 16, bottom: 16),
                  child: CartItem(
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
