import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchTopBar extends StatelessWidget {
  const SearchTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: SvgPicture.asset(
            "assets/logo/Shoplon.svg",
            colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
            height: 30,
            width: 100,
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, mainScreenRoute);
          },
          icon: SvgPicture.asset(
            "assets/icons/Close.svg",
            height: 30,
            colorFilter: ColorFilter.mode(primaryColor, BlendMode.srcIn),
          ),
        ),
      ],
    );
  }
}
