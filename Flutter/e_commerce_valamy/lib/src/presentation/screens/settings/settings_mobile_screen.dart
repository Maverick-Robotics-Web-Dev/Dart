import 'package:e_commerce_valamy/src/presentation/screens/profile/widgets/profile_menu_item_list_tile.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/list_tile/divider_list_tile.dart';
import 'package:flutter/material.dart';

class SettingsMobileScreen extends StatelessWidget {
  final TextTheme? textTheme;

  const SettingsMobileScreen({super.key, this.textTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 16 / 2),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text(
              "Personalization",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          DividerListTileWithTrilingText(
            svgSrc: "assets/icons/Notification.svg",
            title: "Notification",
            trilingText: "Off",
            press: () {
              Navigator.pushNamed(context, 'enableNotificationScreenRoute');
            },
          ),
          ProfileMenuListTile(
            text: "Preferences",
            svgSrc: "assets/icons/Preferences.svg",
            press: () {
              Navigator.pushNamed(context, 'preferencesScreenRoute');
            },
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16 / 2,
            ),
            child: Text(
              "Settings",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          ProfileMenuListTile(
            text: "Language",
            svgSrc: "assets/icons/Language.svg",
            press: () {
              Navigator.pushNamed(context, 'selectLanguageScreenRoute');
            },
          ),
          ProfileMenuListTile(
            text: "Location",
            svgSrc: "assets/icons/Location.svg",
            press: () {},
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16 / 2,
            ),
            child: Text(
              "Help & Support",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          ProfileMenuListTile(
            text: "Get Help",
            svgSrc: "assets/icons/Help.svg",
            press: () {
              Navigator.pushNamed(context, 'getHelpScreenRoute');
            },
          ),
          ProfileMenuListTile(
            text: "FAQ",
            svgSrc: "assets/icons/FAQ.svg",
            press: () {},
            isShowDivider: false,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
