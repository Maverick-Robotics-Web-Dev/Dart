import 'package:e_commerce_valamy/src/presentation/blocs/blocs.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/product/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteMobileScreen extends StatelessWidget {
  final TextTheme? textTheme;

  const FavoriteMobileScreen({super.key, this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              // While loading use 👇
              //  BookMarksSlelton(),
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
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
                        );
                      },
                    );
                  }, childCount: state.popularProducts.length),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
