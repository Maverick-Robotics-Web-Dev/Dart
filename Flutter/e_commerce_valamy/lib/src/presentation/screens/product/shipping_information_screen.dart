import 'package:e_commerce_valamy/config/screen_sizes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/shipping_information_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/shipping_information_tablet_screen.dart';
import 'package:flutter/material.dart';

class ShippingInformationScreen extends StatelessWidget {
  const ShippingInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xLarge &&
              constraints.maxWidth > ScreenSizes.large) {
            return ShippingInformationTabletScreen(textTheme: textTheme);
          } else {
            return ShippingInformationMobileScreen(textTheme: textTheme);
          }
        },
      ),
    );
  }
}
