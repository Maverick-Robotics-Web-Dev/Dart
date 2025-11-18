import 'package:e_commerce_valamy/config/screen_sizes.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/location_permission_store_availability_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/product/location_permission_store_availability_tablet_screen.dart';
import 'package:flutter/material.dart';

class LocationPermissionStoreAvailabilityScreen extends StatelessWidget {
  const LocationPermissionStoreAvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= ScreenSizes.xLarge &&
              constraints.maxWidth > ScreenSizes.large) {
            return LocationPermissionStoreAvailabilityTabletScreen(
              textTheme: textTheme,
            );
          } else {
            return LocationPermissionStoreAvailabilityMobileScreen(
              textTheme: textTheme,
            );
          }
        },
      ),
    );
  }
}
