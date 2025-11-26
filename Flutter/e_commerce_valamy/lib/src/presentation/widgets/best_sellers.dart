import 'package:e_commerce_valamy/config/routes/routes.dart';
import 'package:e_commerce_valamy/src/presentation/blocs/blocs.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/product/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellers extends StatelessWidget {
  const BestSellers({super.key});

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
                itemCount: state.bestSellersProducts.length,
                itemBuilder:
                    (context, index) => Padding(
                      padding: EdgeInsets.only(
                        left: 16.0,
                        right:
                            index == state.bestSellersProducts.length - 1
                                ? 16.0
                                : 0,
                      ),
                      child: ProductCard(
                        image: state.bestSellersProducts[index].image,
                        brandName: state.bestSellersProducts[index].brandName,
                        title: state.bestSellersProducts[index].title,
                        price: state.bestSellersProducts[index].price,
                        priceAfetDiscount:
                            state.bestSellersProducts[index].priceAfetDiscount,
                        dicountpercent:
                            state.bestSellersProducts[index].dicountpercent,
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
