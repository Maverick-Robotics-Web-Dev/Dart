import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormField extends StatelessWidget {
  final bool obscureText;
  final String? svgPath;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final double? height;
  final double? width;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.svgPath,
    this.height = 24,
    this.width = 24,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged,
    this.errorText,
    this.labelText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: AppColorScheme.light.onPrimary,
        label: labelText != null ? Text(labelText!) : null,
        hintText: hintText,
        errorText: errorText,
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
      ),
    );
  }
}
