import 'package:e_commerce_valamy/config/screen_sizes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/kids/kids_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/kids/kids_tablet_screen.dart';
import 'package:flutter/material.dart';

class KidsScreen extends StatelessWidget {
  const KidsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xLarge &&
              constraints.maxWidth > ScreenSizes.large) {
            return KidsTabletScreen(textTheme: textTheme);
          } else {
            return KidsMobileScreen(textTheme: textTheme);
          }
        },
      ),
    );
  }
}
