import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String svgPath;
  final String hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final double? height;
  final double? width;
  final double? fontSize;

  const TextFormFieldCustom({
    super.key,
    required this.svgPath,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.height = 24,
    this.width = 24,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) => TextFormField(
    // validator: emaildValidator.call,
    // textInputAction: TextInputAction.next,
    keyboardType: keyboardType,
    obscureText: obscureText,
    style: TextStyle(color: textColor, fontSize: fontSize),
    decoration: InputDecoration(
      hintText: hintText,
      prefixIcon: Padding(
        padding: EdgeInsets.symmetric(vertical: h_16 * 0.75),
        child: SvgPicture.asset(
          svgPath,
          height: height,
          width: width,
          colorFilter: ColorFilter.mode(
            Theme.of(context).textTheme.bodyLarge!.color!.withValues(
              alpha: 0.8,
              red: 0.051,
              green: 0.278,
              blue: 0.631,
            ),
            BlendMode.srcIn,
          ),
        ),
      ),
    ),
  );
}
