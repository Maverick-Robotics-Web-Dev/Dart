import 'package:e_commerce_valamy/config/screen_sizes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/favorite/favorite_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/favorite/favorite_tablet_screen.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xLarge &&
              constraints.maxWidth > ScreenSizes.large) {
            return FavoriteTabletScreen(textTheme: textTheme);
          } else {
            return FavoriteMobileScreen(textTheme: textTheme);
          }
        },
      ),
    );
  }
}
