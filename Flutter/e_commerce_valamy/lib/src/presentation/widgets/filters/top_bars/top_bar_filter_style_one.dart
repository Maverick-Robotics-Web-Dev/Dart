import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopBarFilterStyleOne extends StatelessWidget {
  final String centerTitle;
  final String? rightTitle;
  final String? svgSrc;

  const TopBarFilterStyleOne({
    super.key,
    required this.centerTitle,
    this.rightTitle,
    this.svgSrc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: SvgPicture.asset(
              svgSrc != null ? svgSrc! : "assets/icons/Arrow - Left.svg",
              height: 30,
              colorFilter: const ColorFilter.mode(
                primaryColor,
                BlendMode.srcIn,
              ),
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
          Text(
            rightTitle != null ? rightTitle! : 'Clear All',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
