import 'package:e_commerce_valamy/config/screen_sizes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/size_guide_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/size_guide_tablet_screen.dart';
import 'package:flutter/material.dart';

class SizeGuideScreen extends StatelessWidget {
  const SizeGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xLarge &&
              constraints.maxWidth > ScreenSizes.large) {
            return SizeGuideTabletScreen(textTheme: textTheme);
          } else {
            return SizeGuideMobileScreen(textTheme: textTheme);
          }
        },
      ),
    );
  }
}
