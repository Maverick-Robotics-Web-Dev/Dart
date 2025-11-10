import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/screens/profile/widgets/profile_card.dart';
import 'package:e_commerce_valamy/src/presentation/screens/profile/widgets/profile_menu_item_list_tile.dart';
import 'package:e_commerce_valamy/src/presentation/widgets/network_image_with_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileMobileScreen extends StatefulWidget {
  final TextTheme? textTheme;

  const ProfileMobileScreen({super.key, this.textTheme});

  @override
  State<ProfileMobileScreen> createState() => _ProfileMobileScreenState();
}

class _ProfileMobileScreenState extends State<ProfileMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ProfileCard(
            name: "Sepide",
            email: "theflutterway@gmail.com",
            imageSrc: "https://i.imgur.com/IXnwbLk.png",
            // proLableText: "Sliver",
            // isPro: true, if the user is pro
            press: () {
              Navigator.pushNamed(context, 'userInfoScreenRoute');
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16 * 1.5,
            ),
            child: GestureDetector(
              onTap: () {},
              child: const AspectRatio(
                aspectRatio: 1.8,
                child: NetworkImageWithLoader(
                  "https://i.imgur.com/dz0BBom.png",
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Account",
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const SizedBox(height: 16 / 2),
          ProfileMenuListTile(
            text: "Orders",
            svgSrc: "assets/icons/Order.svg",
            press: () {
              Navigator.pushNamed(context, 'ordersScreenRoute');
            },
          ),
          ProfileMenuListTile(
            text: "Returns",
            svgSrc: "assets/icons/Return.svg",
            press: () {},
          ),
          ProfileMenuListTile(
            text: "Wishlist",
            svgSrc: "assets/icons/Wishlist.svg",
            press: () {},
          ),
          ProfileMenuListTile(
            text: "Addresses",
            svgSrc: "assets/icons/Address.svg",
            press: () {
              Navigator.pushNamed(context, 'addressesScreenRoute');
            },
          ),
          ProfileMenuListTile(
            text: "Payment",
            svgSrc: "assets/icons/card.svg",
            press: () {
              Navigator.pushNamed(context, 'emptyPaymentScreenRoute');
            },
          ),
          ProfileMenuListTile(
            text: "Wallet",
            svgSrc: "assets/icons/Wallet.svg",
            press: () {
              Navigator.pushNamed(context, 'walletScreenRoute');
            },
          ),
          const SizedBox(height: 16),
          // Padding(
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: 16,
          //     vertical: 16 / 2,
          //   ),
          //   child: Text(
          //     "Personalization",
          //     style: Theme.of(context).textTheme.titleSmall,
          //   ),
          // ),
          // DividerListTileWithTrilingText(
          //   svgSrc: "assets/icons/Notification.svg",
          //   title: "Notification",
          //   trilingText: "Off",
          //   press: () {
          //     Navigator.pushNamed(context, 'enableNotificationScreenRoute');
          //   },
          // ),
          // ProfileMenuListTile(
          //   text: "Preferences",
          //   svgSrc: "assets/icons/Preferences.svg",
          //   press: () {
          //     Navigator.pushNamed(context, 'preferencesScreenRoute');
          //   },
          // ),
          // const SizedBox(height: 16),
          // Padding(
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: 16,
          //     vertical: 16 / 2,
          //   ),
          //   child: Text(
          //     "Settings",
          //     style: Theme.of(context).textTheme.titleSmall,
          //   ),
          // ),
          // ProfileMenuListTile(
          //   text: "Language",
          //   svgSrc: "assets/icons/Language.svg",
          //   press: () {
          //     Navigator.pushNamed(context, 'selectLanguageScreenRoute');
          //   },
          // ),
          // ProfileMenuListTile(
          //   text: "Location",
          //   svgSrc: "assets/icons/Location.svg",
          //   press: () {},
          // ),
          // const SizedBox(height: 16),
          // Padding(
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: 16,
          //     vertical: 16 / 2,
          //   ),
          //   child: Text(
          //     "Help & Support",
          //     style: Theme.of(context).textTheme.titleSmall,
          //   ),
          // ),
          // ProfileMenuListTile(
          //   text: "Get Help",
          //   svgSrc: "assets/icons/Help.svg",
          //   press: () {
          //     Navigator.pushNamed(context, 'getHelpScreenRoute');
          //   },
          // ),
          // ProfileMenuListTile(
          //   text: "FAQ",
          //   svgSrc: "assets/icons/FAQ.svg",
          //   press: () {},
          //   isShowDivider: false,
          // ),
          // const SizedBox(height: 16),

          // Log Out
          ListTile(
            onTap: () {},
            minLeadingWidth: 24,
            leading: SvgPicture.asset(
              "assets/icons/Logout.svg",
              height: 24,
              width: 24,
              colorFilter: const ColorFilter.mode(
                warningColor,
                BlendMode.srcIn,
              ),
            ),
            title: const Text(
              "Log Out",
              style: TextStyle(color: warningColor, fontSize: 14, height: 1),
            ),
          ),
        ],
      ),
    );
  }
}
