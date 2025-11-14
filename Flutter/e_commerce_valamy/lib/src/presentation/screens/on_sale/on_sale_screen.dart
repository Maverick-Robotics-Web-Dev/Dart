import 'package:e_commerce_valamy/config/screen_sizes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/on_sale/on_sale_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/on_sale/on_sale_tablet_screen.dart';
import 'package:flutter/material.dart';

class OnSaleScreen extends StatelessWidget {
  const OnSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xLarge &&
              constraints.maxWidth > ScreenSizes.large) {
            return OnSaleTabletScreen(textTheme: textTheme);
          } else {
            return OnSaleMobileScreen(textTheme: textTheme);
          }
        },
      ),
    );
  }
}
