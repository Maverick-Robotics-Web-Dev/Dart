import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainMobileScreen extends StatefulWidget {
  final TextTheme? textTheme;

  const MainMobileScreen({super.key, this.textTheme});

  @override
  State<MainMobileScreen> createState() => _MainMobileScreenState();
}

class _MainMobileScreenState extends State<MainMobileScreen> {
  @override
  Widget build(BuildContext context) {
    SvgPicture svgIcon(String src, {Color? color}) {
      return SvgPicture.asset(
        src,
        height: 24,
        colorFilter: ColorFilter.mode(
          color ??
              Theme.of(context).iconTheme.color!.withOpacity(
                Theme.of(context).brightness == Brightness.dark ? 0.3 : 1,
              ),
          BlendMode.srcIn,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: SizedBox(),
        leadingWidth: 0,
        centerTitle: false,
        title: SvgPicture.asset(
          "assets/logo/Shoplon.svg",
          colorFilter: ColorFilter.mode(whiteColor, BlendMode.srcIn),
          height: 22,
          width: 100,
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.pushNamed(context, searchScreenRoute);
            },
            icon: SvgPicture.asset(
              "assets/icons/Search.svg",
              height: 28,
              colorFilter: ColorFilter.mode(whiteColor, BlendMode.srcIn),
            ),
          ),
          IconButton(
            onPressed: () {
              // Navigator.pushNamed(context, notificationsScreenRoute);
            },
            icon: SvgPicture.asset(
              "assets/icons/Notification.svg",
              height: 28,
              colorFilter: ColorFilter.mode(whiteColor, BlendMode.srcIn),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Main Mobile Screen',
          style: widget.textTheme?.headlineLarge,
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 8),
        color: whiteColor,
        child: BottomNavigationBar(
          backgroundColor: whiteColor,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          selectedItemColor: Colors.blue,
          unselectedItemColor: secondaryColor,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
          items: [
            BottomNavigationBarItem(
              icon: svgIcon("assets/icons/Bag.svg"),
              activeIcon: svgIcon(
                "assets/icons/bag_full.svg",
                color: Colors.blue,
              ),
              label: "Tienda",
            ),
            BottomNavigationBarItem(
              icon: svgIcon("assets/icons/Category.svg", color: blackColor),
              activeIcon: svgIcon(
                "assets/icons/Category.svg",
                color: primaryColor,
              ),
              label: "Favoritos",
            ),
            BottomNavigationBarItem(
              icon: svgIcon("assets/icons/Bookmark.svg"),
              activeIcon: svgIcon(
                "assets/icons/Bookmark.svg",
                color: primaryColor,
              ),
              label: "Mi Cuenta",
            ),
            BottomNavigationBarItem(
              icon: svgIcon("assets/icons/Bag.svg"),
              activeIcon: svgIcon("assets/icons/Bag.svg", color: primaryColor),
              label: "Carrito",
            ),
            BottomNavigationBarItem(
              icon: svgIcon("assets/icons/Profile.svg"),
              activeIcon: svgIcon(
                "assets/icons/Profile.svg",
                color: primaryColor,
              ),
              label: "Ajustes",
            ),
          ],
        ),
      ),
    );
  }
}
