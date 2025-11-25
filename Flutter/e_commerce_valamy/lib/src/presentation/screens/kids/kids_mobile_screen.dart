import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/providers/products_provider.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/app_bars/app_bar_style_one.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/banners/L/banner_l_style_1.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/banners/S/banner_s_style_1.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/banners/S/banner_s_style_2.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/product/product_card.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/text_form_field_search_with_filters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class KidsMobileScreen extends StatelessWidget {
  final TextTheme? textTheme;

  const KidsMobileScreen({super.key, this.textTheme});

  @override
  Widget build(BuildContext context) {
    final productsProvider =
        context.watch<ProductsProvider>()..loadKidsProducts();

    return Scaffold(
      appBar: AppBarStyleOne(
        title: 'Kids',
        backgroundColor: Colors.transparent,
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
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 16 * 1.5, horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: TextFormFieldSearchWithFilters(),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  BannerLStyle1(
                    title: "summer \nsale",
                    subtitle: "SPECIAL OFFER",
                    discountPercent: 50,
                    press: () {
                      Navigator.pushNamed(context, 'onSaleScreenRoute');
                    },
                  ),
                  SizedBox(height: 16 / 4),
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
                    title: "Black \nfriday",
                    subtitle: "50% Off",
                    bottomText: "Collection".toUpperCase(),
                    press: () {
                      Navigator.pushNamed(context, 'onSaleScreenRoute');
                    },
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                    image: productsProvider.kidsProducts[index].image,
                    brandName: productsProvider.kidsProducts[index].brandName,
                    title: productsProvider.kidsProducts[index].title,
                    price: productsProvider.kidsProducts[index].price,
                    priceAfetDiscount:
                        productsProvider.kidsProducts[index].priceAfetDiscount,
                    dicountpercent:
                        productsProvider.kidsProducts[index].dicountpercent,
                    press: () {
                      Navigator.pushNamed(context, 'productDetailsScreenRoute');
                    },
                  );
                }, childCount: productsProvider.kidsProducts.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
