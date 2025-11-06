import 'package:e_commerce_valamy/src/presentation/widgets/banners/M/banner_m_with_counter.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/popular_products.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/product/product_card.dart';
import 'package:flutter/material.dart';

class FlashSale extends StatelessWidget {
  const FlashSale({super.key});

  @override
  Widget build(BuildContext context) {
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
            itemCount: demoFlashSaleProducts.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsets.only(
                    left: 16.0,
                    right: index == demoFlashSaleProducts.length - 1 ? 16.0 : 0,
                  ),
                  child: ProductCard(
                    image: demoFlashSaleProducts[index].image,
                    brandName: demoFlashSaleProducts[index].brandName,
                    title: demoFlashSaleProducts[index].title,
                    price: demoFlashSaleProducts[index].price,
                    priceAfetDiscount:
                        demoFlashSaleProducts[index].priceAfetDiscount,
                    dicountpercent: demoFlashSaleProducts[index].dicountpercent,
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
