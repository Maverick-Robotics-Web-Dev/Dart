import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:bee_viajes_turismo/domain/domain.dart';
import 'package:flutter/material.dart';

import 'product_mobile_screen.dart';
import 'product_tablet_screen.dart';

class ProductScreen extends StatelessWidget {
  final Product? product;

  const ProductScreen({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    ThemeData apptheme = Theme.of(context);
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xl &&
              constraints.maxWidth > ScreenSizes.lg) {
            return ProductTabletScreen(appTheme: apptheme);
          } else {
            return ProductMobileScreen(appTheme: apptheme, product: product);
          }
        },
      ),
    );
  }
}
