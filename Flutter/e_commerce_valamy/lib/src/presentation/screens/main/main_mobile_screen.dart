import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/src/presentation/screens/cart/cart_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/favorite/favorite_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/home/home_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/profile/profile_mobile_screen.dart';
import 'package:e_commerce_valamy/src/presentation/screens/settings/settings_mobile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainMobileScreen extends StatefulWidget {
  final TextTheme? textTheme;

  const MainMobileScreen({super.key, this.textTheme});

  @override
  State<MainMobileScreen> createState() => _MainMobileScreenState();
}

class _MainMobileScreenState extends State<MainMobileScreen> {
  int currentIndex = 0;
  final List<Widget> screens = [
    HomeMobileScreen(),
    FavoriteMobileScreen(),
    ProfileMobileScreen(),
    CartMobileScreen(),
    SettingsMobileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    SvgPicture svgIcon(String src, {Color? color}) {
      return SvgPicture.asset(
        src,
        height: 32,
        colorFilter: ColorFilter.mode(color ?? blackColor, BlendMode.srcIn),
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
      // body: IndexedStack(index: currentIndex, children: screens),
      body: AnimatedSwitcher(
        // key: ValueKey(currentIndex),
        duration: Duration(milliseconds: 500),
        transitionBuilder: (child, animation) {
          print('ANIMATION STATUS: ${animation.status}');
          print('ANIMATION VALUE: ${animation.value}');

          final entryAnimation = Tween<Offset>(
            begin: const Offset(1.0, 0.0), // Entra desde la derecha
            end: Offset.zero,
          ).animate(animation);

          // Esta es la animación de salida (widget antiguo)
          final exitAnimation = Tween<Offset>(
            begin: Offset.zero, // Sale del centro
            end: const Offset(-1.0, 0.0), // Sale hacia la izquierda
          ).animate(animation);
          // final isPop = animation.status == AnimationStatus.completed;
          final isPop = animation.value == 1.0;
          print(' IS POP: $isPop');
          // final tween = Tween(
          //   begin: isPop ? end : begin,
          //   end: isPop ? Offset(-1, 0) : end,
          // ).chain(CurveTween(curve: curve));
          // final offsetAnimation = animation.drive(
          //   isPop ? entryAnimation : exitAnimation,
          // );

          return SlideTransition(
            position: isPop ? exitAnimation : entryAnimation,
            child: child,
          );
        },
        child: screens[currentIndex],
      ),
      // body: AnimatedSwitcher(
      //   duration: Duration(milliseconds: 300),
      //   transitionBuilder: (child, animation) {
      //     const begin = Offset(1, 0);
      //     const end = Offset.zero;
      //     const curve = Curves.easeInOut;
      //     final isPop = animation.status == AnimationStatus.reverse;
      //     final tween = Tween(begin: begin, end: end).animate(animation);

      //     return SlideTransition(position: tween, child: child);
      //   },
      //   child: screens[currentIndex],
      // ),
      // body: AnimatedSwitcher(
      //   duration: Duration(milliseconds: 300),
      //   transitionBuilder: (child, animation) {
      //     const begin = Offset(1, 0);
      //     const end = Offset.zero;
      //     const curve = Curves.easeInOut;
      //     final isPop = animation.status == AnimationStatus.reverse;
      //     final tween = Tween(
      //       begin: isPop ? end : begin,
      //       end: isPop ? Offset(-1, 0) : end,
      //     ).chain(CurveTween(curve: curve));
      //     final offsetAnimation = animation.drive(tween);

      //     return SlideTransition(position: offsetAnimation, child: child);
      //   },
      //   child: screens[currentIndex],
      // ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 8),
        color: whiteColor,
        child: BottomNavigationBar(
          backgroundColor: whiteColor,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.blue,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: svgIcon(
                "assets/iconsSVG/bag_outlined.svg",
                color: Colors.blue,
              ),
              activeIcon: svgIcon(
                "assets/iconsSVG/bag_filled.svg",
                color: primaryColor,
              ),
              label: "Tienda",
            ),
            BottomNavigationBarItem(
              icon: svgIcon(
                "assets/iconsSVG/favorite_outlined.svg",
                color: Colors.blue,
              ),
              activeIcon: svgIcon(
                "assets/iconsSVG/favorite_filled.svg",
                color: primaryColor,
              ),
              label: "Favoritos",
            ),
            BottomNavigationBarItem(
              icon: svgIcon(
                "assets/iconsSVG/user_outlined.svg",
                color: Colors.blue,
              ),
              activeIcon: svgIcon(
                "assets/iconsSVG/user_filled.svg",
                color: primaryColor,
              ),
              label: "Mi Perfil",
            ),
            BottomNavigationBarItem(
              icon: svgIcon(
                "assets/iconsSVG/cart_outlined.svg",
                color: Colors.blue,
              ),
              activeIcon: svgIcon(
                "assets/iconsSVG/cart_filled.svg",
                color: primaryColor,
              ),
              label: "Carrito",
            ),
            BottomNavigationBarItem(
              icon: svgIcon(
                "assets/iconsSVG/settings_outlined.svg",
                color: Colors.blue,
              ),
              activeIcon: svgIcon(
                "assets/iconsSVG/settings_filled.svg",
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
