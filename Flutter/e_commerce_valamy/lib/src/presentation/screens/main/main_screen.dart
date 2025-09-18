import 'package:e_commerce_valamy/config/screen_sizes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/main/main_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/main/main_tablet_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xLarge &&
              constraints.maxWidth > ScreenSizes.large) {
            return MainTabletScreen(textTheme: textTheme);
          } else {
            return MainMobileScreen(textTheme: textTheme);
          }
        },
      ),
    );
  }
}
