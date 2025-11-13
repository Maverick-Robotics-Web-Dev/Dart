import 'package:e_commerce_valamy/config/screen_sizes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/notification/notification_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/notification/notification_tablet_screen.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xLarge &&
              constraints.maxWidth > ScreenSizes.large) {
            return NotificationTabletScreen(textTheme: textTheme);
          } else {
            return NotificationMobileScreen(textTheme: textTheme);
          }
        },
      ),
    );
  }
}
