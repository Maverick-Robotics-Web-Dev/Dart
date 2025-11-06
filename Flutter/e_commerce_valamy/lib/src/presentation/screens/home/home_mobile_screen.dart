import 'package:e_commerce_valamy/src/presentation/widgets/banners/S/banner_s_style_1.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/banners/S/banner_s_style_5.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/carousel_custom.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/flash_sale.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/popular_products.dart';
import 'package:flutter/material.dart';

class HomeMobileScreen extends StatelessWidget {
  final TextTheme? textTheme;

  const HomeMobileScreen({super.key, this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: CarouselCustom()),
            SliverToBoxAdapter(child: PopularProducts()),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 16.0 * 1.5),
              sliver: SliverToBoxAdapter(child: FlashSale()),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  // While loading use 👇
                  // const BannerMSkelton(),‚
                  BannerSStyle1(
                    title: "New \narrival",
                    subtitle: "SPECIAL OFFER",
                    discountParcent: 50,
                    press: () {
                      Navigator.pushNamed(context, 'onSaleScreenRoute');
                    },
                  ),
                  const SizedBox(height: 16.0 / 4),
                  BannerSStyle5(
                    title: "Summer \nsale",
                    subtitle: "SPECIAL OFFER",
                    bottomText: "up to 80% off".toUpperCase(),
                    press: () {
                      Navigator.pushNamed(context, 'onSaleScreenRoute');
                    },
                  ),
                  const SizedBox(height: 16.0 / 4),
                  BannerSStyle5(
                    title: "Black \nfriday",
                    subtitle: "50% Off",
                    bottomText: "Collection".toUpperCase(),
                    press: () {
                      Navigator.pushNamed(context, 'onSaleScreenRoute');
                    },
                  ),
                  // We have 4 banner styles, all in the pro version
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
