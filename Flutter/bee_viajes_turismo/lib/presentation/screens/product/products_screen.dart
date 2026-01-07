import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:flutter/material.dart';

import 'products_mobile_screen.dart';
import 'products_tablet_screen.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData apptheme = Theme.of(context);

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xl &&
              constraints.maxWidth > ScreenSizes.lg) {
            return ProductsTabletScreen(appTheme: apptheme);
          } else {
            return ProductsMobileScreen(appTheme: apptheme);
          }
        },
      ),
    );
  }
}
