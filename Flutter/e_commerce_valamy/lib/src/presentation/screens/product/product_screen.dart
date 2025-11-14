import 'package:e_commerce_valamy/config/screen_sizes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/product_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/product_tablet_screen.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final bool isProductAvailable;

  const ProductScreen({super.key, required this.isProductAvailable});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xLarge &&
              constraints.maxWidth > ScreenSizes.large) {
            return ProductTabletScreen(textTheme: textTheme);
          } else {
            return ProductMobileScreen(
              isProductAvailable: isProductAvailable,
              textTheme: textTheme,
            );
          }
        },
      ),
    );
  }
}
