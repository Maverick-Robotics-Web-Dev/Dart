import 'package:e_commerce_valamy/config/screen_sizes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/cart/cart_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/cart/cart_tablet_screen.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xLarge &&
              constraints.maxWidth > ScreenSizes.large) {
            return CartTabletScreen(textTheme: textTheme);
          } else {
            return CartMobileScreen(textTheme: textTheme);
          }
        },
      ),
    );
  }
}
