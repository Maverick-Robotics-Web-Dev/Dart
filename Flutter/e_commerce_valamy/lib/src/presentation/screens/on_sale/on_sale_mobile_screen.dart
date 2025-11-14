import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/app_bars/app_bar_style_one.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/banners/L/banner_l_style_1.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/banners/S/banner_s_style_1.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/banners/S/banner_s_style_2.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/best_sellers.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/flash_sale.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/most_popular.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/popular_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnSaleMobileScreen extends StatelessWidget {
  final TextTheme? textTheme;

  const OnSaleMobileScreen({super.key, this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyleOne(
        title: 'On Sale',
        backgroundColor: whiteColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'searchScreenRoute');
            },
            icon: SvgPicture.asset(
              "assets/iconsSVG/cart_filled.svg",
              height: 28,
              colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: BannerLStyle1(
                title: "summer \nsale",
                subtitle: "SPECIAL OFFER",
                discountPercent: 50,
                press: () {
                  Navigator.pushNamed(context, 'onSaleScreenRoute');
                },
              ),
            ),
            SliverToBoxAdapter(child: BestSellers()),
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
                  BannerSStyle2(
                    title: "Summer \nsale",
                    subtitle: "SPECIAL OFFER",
                    bottomText: "up to 80% off".toUpperCase(),
                    press: () {
                      Navigator.pushNamed(context, 'onSaleScreenRoute');
                    },
                  ),
                  const SizedBox(height: 16.0 / 4),
                  BannerSStyle2(
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
            SliverToBoxAdapter(child: PopularProducts()),
            SliverToBoxAdapter(child: MostPopular()),
            SliverPadding(
              padding: EdgeInsets.only(top: 16.0 * 1.5),
              sliver: SliverToBoxAdapter(
                child: BannerLStyle1(
                  title: "summer \nsale",
                  subtitle: "SPECIAL OFFER",
                  discountPercent: 50,
                  press: () {
                    Navigator.pushNamed(context, 'onSaleScreenRoute');
                  },
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(bottom: 16.0 * 1.5),
              sliver: SliverToBoxAdapter(child: BestSellers()),
            ),
          ],
        ),
      ),
    );
  }
}
