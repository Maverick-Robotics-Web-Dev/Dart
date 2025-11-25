import 'package:e_commerce_valamy/config/routes/routes.dart';
import 'package:e_commerce_valamy/src/presentation/providers/products_provider.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/banners/M/banner_m_with_counter.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/product/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlashSale extends StatelessWidget {
  const FlashSale({super.key});

  @override
  Widget build(BuildContext context) {
    final productsProvider =
        context.watch<ProductsProvider>()..loadFlashSaleProducts();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // While loading show 👇
        // const BannerMWithCounterSkelton(),
        BannerMWithCounter(
          duration: const Duration(hours: 8),
          text: "Super Flash Sale \n50% Off",
          press: () {},
        ),
        const SizedBox(height: 16.0 / 2),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Flash sale",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // While loading show 👇
        // const ProductsSkelton(),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            // Find demoFlashSaleProducts on models/ProductModel.dart
            itemCount: productsProvider.flashSaleProducts.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsets.only(
                    left: 16.0,
                    right:
                        index == productsProvider.flashSaleProducts.length - 1
                            ? 16.0
                            : 0,
                  ),
                  child: ProductCard(
                    image: productsProvider.flashSaleProducts[index].image,
                    brandName:
                        productsProvider.flashSaleProducts[index].brandName,
                    title: productsProvider.flashSaleProducts[index].title,
                    price: productsProvider.flashSaleProducts[index].price,
                    priceAfetDiscount:
                        productsProvider
                            .flashSaleProducts[index]
                            .priceAfetDiscount,
                    dicountpercent:
                        productsProvider
                            .flashSaleProducts[index]
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
