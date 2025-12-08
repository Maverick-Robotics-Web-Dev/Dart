import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:bee_viajes_turismo/presentation/screens/notification/notification_mobile_screen.dart';
import 'package:bee_viajes_turismo/presentation/screens/notification/notification_tablet_screen.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final String pushMessageId;

  const NotificationScreen({super.key, required this.pushMessageId});

  @override
  Widget build(BuildContext context) {
    ThemeData apptheme = Theme.of(context);

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xl &&
              constraints.maxWidth > ScreenSizes.lg) {
            return NotificationTabletScreen(appTheme: apptheme);
          } else {
            return NotificationMobileScreen(
              appTheme: apptheme,
              pushMessageId: pushMessageId,
            );
          }
        },
      ),
    );
  }
}
