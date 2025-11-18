import 'package:e_commerce_valamy/config/screen_sizes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/product_buy_now_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/product_buy_now_tablet_screen.dart';
import 'package:flutter/material.dart';

class ProductBuyNowScreen extends StatelessWidget {
  const ProductBuyNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xLarge &&
              constraints.maxWidth > ScreenSizes.large) {
            return ProductBuyNowTabletScreen(textTheme: textTheme);
          } else {
            return ProductBuyNowMobileScreen(textTheme: textTheme);
          }
        },
      ),
    );
  }
}
