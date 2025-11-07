import 'package:e_commerce_valamy/src/presentation/screens/cart/widgets/cart_item.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/popular_products.dart';
import 'package:flutter/material.dart';

class ReviewYourOrder extends StatefulWidget {
  const ReviewYourOrder({super.key});

  @override
  State<ReviewYourOrder> createState() => _ReviewYourOrderState();
}

class _ReviewYourOrderState extends State<ReviewYourOrder> {
  @override
  Widget build(BuildContext context) {
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
            itemCount: demoPopularProducts.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsets.only(right: 16, left: 16, bottom: 16),
                  child: CartItem(
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
