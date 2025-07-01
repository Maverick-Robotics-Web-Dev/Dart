import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TxtFormFieldCustom extends StatelessWidget {
  final String svgPath;
  final TextInputType? keyboardType;
  final String? hintText;
  final double? height;
  final double? width;

  const TxtFormFieldCustom({
    super.key,
    required this.svgPath,
    this.keyboardType,
    this.hintText,
    this.height = 24,
    this.width = 24,
  });

  @override
  Widget build(BuildContext context) => TextFormField(
    // validator: emaildValidator.call,
    // textInputAction: TextInputAction.next,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      hintText: hintText,
      prefixIcon: Padding(
        padding: EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
        child: SvgPicture.asset(
          svgPath,
          height: height,
          width: width,
          colorFilter: ColorFilter.mode(
            Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.3),
            BlendMode.srcIn,
          ),
        ),
      ),
    ),
  );
}
