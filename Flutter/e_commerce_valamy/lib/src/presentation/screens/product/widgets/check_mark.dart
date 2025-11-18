import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CheckMark extends StatelessWidget {
  const CheckMark({
    super.key,
    this.radious = 8,
    this.activeColor = primaryColor,
    this.iconColor = Colors.white,
    this.padding = const EdgeInsets.all(2),
  });
  final double radious;
  final Color activeColor, iconColor;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 8,
      backgroundColor: activeColor,
      child: Padding(
        padding: padding,
        child: SvgPicture.asset(
          "assets/icons/Singlecheck.svg",
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
      ),
    );
  }
}
