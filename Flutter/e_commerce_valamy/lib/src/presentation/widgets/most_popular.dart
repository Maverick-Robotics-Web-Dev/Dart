import 'package:e_commerce_valamy/config/routes/routes.dart';
import 'package:e_commerce_valamy/src/presentation/blocs/blocs.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/product/secondary_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MostPopular extends StatelessWidget {
  const MostPopular({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
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
                itemCount: state.popularProducts.length,
                itemBuilder:
                    (context, index) => Padding(
                      padding: EdgeInsets.only(
                        left: 16.0,
                        right:
                            index == state.popularProducts.length - 1
                                ? 16.0
                                : 0,
                      ),
                      child: SecondaryProductCard(
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
      },
    );
  }
}
