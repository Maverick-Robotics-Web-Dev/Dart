import 'package:e_commerce_valamy/config/screen_sizes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/product_returns_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/product_returns_tablet_screen.dart';
import 'package:flutter/material.dart';

class ProductReturnsScreen extends StatelessWidget {
  const ProductReturnsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xLarge &&
              constraints.maxWidth > ScreenSizes.large) {
            return ProductReturnsTabletScreen(textTheme: textTheme);
          } else {
            return ProductReturnsMobileScreen(textTheme: textTheme);
          }
        },
      ),
    );
  }
}
