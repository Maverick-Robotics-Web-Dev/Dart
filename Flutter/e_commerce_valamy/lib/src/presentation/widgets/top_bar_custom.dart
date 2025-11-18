import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopBarCustom extends StatelessWidget {
  final String centerTitle;
  final String rightTitle;
  final String svgSrc;
  final bool showRightTitle;
  final String svgSrcRight;

  const TopBarCustom({
    super.key,
    required this.centerTitle,
    this.rightTitle = 'Clear All',
    this.svgSrc = "assets/icons/Arrow - Left.svg",
    this.showRightTitle = true,
    this.svgSrcRight = "assets/icons/Close.svg",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: SvgPicture.asset(
            svgSrc,
            height: 30,
            colorFilter: const ColorFilter.mode(primaryColor, BlendMode.srcIn),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        Text(
          centerTitle,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
        ),
        if (showRightTitle)
          TextButton(
            onPressed: () {},
            child: Text(
              rightTitle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.blue,
              ),
            ),
          ),
        if (!showRightTitle)
          IconButton(
            icon: SvgPicture.asset(
              svgSrcRight,
              height: 30,
              colorFilter: const ColorFilter.mode(
                primaryColor,
                BlendMode.srcIn,
              ),
            ),
            onPressed: () {},
          ),
      ],
    );
  }
}
