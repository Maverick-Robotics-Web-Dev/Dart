import 'package:e_commerce_valamy/config/screen_sizes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/reviews/product_reviews_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/reviews/product_reviews_tablet_screen.dart';
import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatefulWidget {
  const ProductReviewsScreen({super.key});

  @override
  State<ProductReviewsScreen> createState() => _ProductReviewsScreenState();
}

class _ProductReviewsScreenState extends State<ProductReviewsScreen> {
  String? selected = "most";

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xLarge &&
              constraints.maxWidth > ScreenSizes.large) {
            return ProductReviewsTabletScreen(textTheme: textTheme);
          } else {
            return ProductReviewsMobileScreen(textTheme: textTheme);
          }
        },
      ),
    );
  }
}
