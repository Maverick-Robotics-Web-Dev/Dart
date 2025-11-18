import 'package:e_commerce_valamy/config/screen_sizes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/added_to_cart_message_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/added_to_cart_message_tablet_screen.dart';
import 'package:flutter/material.dart';

class AddedToCartMessageScreen extends StatelessWidget {
  const AddedToCartMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xLarge &&
              constraints.maxWidth > ScreenSizes.large) {
            return AddedToCartMessageTabletScreen(textTheme: textTheme);
          } else {
            return AddedToCartMessageMobileScreen(textTheme: textTheme);
          }
        },
      ),
    );
  }
}
