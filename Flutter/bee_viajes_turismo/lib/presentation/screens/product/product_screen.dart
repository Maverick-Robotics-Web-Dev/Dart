import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:flutter/material.dart';

import 'product_mobile_screen.dart';
import 'product_tablet_screen.dart';

class ProductScreen extends StatelessWidget {
  final String productId;

  const ProductScreen({super.key, required this.productId});

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
            return ProductMobileScreen(appTheme: apptheme,productId: productId,);
          }
        },
      ),
    );
  }
}
