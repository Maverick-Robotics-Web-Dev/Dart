import 'package:e_commerce_valamy/config/screen_sizes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/reviews/product_add_review_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/reviews/product_add_review_tablet_screen.dart';
import 'package:flutter/material.dart';

class ProductAddReviewScreen extends StatelessWidget {
  const ProductAddReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xLarge &&
              constraints.maxWidth > ScreenSizes.large) {
            return ProductAddReviewTabletScreen(textTheme: textTheme);
          } else {
            return ProductAddReviewMobileScreen(textTheme: textTheme);
          }
        },
      ),
    );
  }
}
