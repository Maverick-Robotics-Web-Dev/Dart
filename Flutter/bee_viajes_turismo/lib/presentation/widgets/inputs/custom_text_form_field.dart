import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormField extends StatelessWidget {
  final String? svgPath;
  final String? hintText;
  final double? height;
  final double? width;
  final bool obscureText;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.svgPath,
    this.height = 24,
    this.width = 24,
    this.obscureText = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: AppColorScheme.light.onPrimary,
        hintText: hintText,
        prefixIcon: svgPath != null
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: SvgPicture.asset(
                  svgPath!,
                  height: height,
                  width: width,
                  colorFilter: ColorFilter.mode(
                    AppColorScheme.light.primary,
                    BlendMode.srcIn,
                  ),
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RadiusTokens.md),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColorScheme.light.primary,
            width: 1.6,
          ),
          borderRadius: BorderRadius.circular(RadiusTokens.md),
        ),
      ),
    );
  }
}
