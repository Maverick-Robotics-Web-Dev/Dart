import 'package:e_commerce_valamy/src/presentation/blocs/blocs.dart';
import 'package:e_commerce_valamy/src/presentation/screens/cart/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewYourOrder extends StatefulWidget {
  const ReviewYourOrder({super.key});

  @override
  State<ReviewYourOrder> createState() => _ReviewYourOrderState();
}

class _ReviewYourOrderState extends State<ReviewYourOrder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
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
                itemCount: state.popularProducts.length,
                itemBuilder:
                    (context, index) => Padding(
                      padding: EdgeInsets.only(right: 16, left: 16, bottom: 16),
                      child: CartItem(
                        image: state.popularProducts[index].image,
                        brandName: state.popularProducts[index].brandName,
                        title: state.popularProducts[index].title,
                        price: state.popularProducts[index].price,
                        priceAfetDiscount:
                            state.popularProducts[index].priceAfetDiscount,
                        dicountpercent:
                            state.popularProducts[index].dicountpercent,
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
      },
    );
  }
}
