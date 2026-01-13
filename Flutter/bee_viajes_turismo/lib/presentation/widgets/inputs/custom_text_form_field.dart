import 'package:bee_viajes_turismo/config/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormField extends StatelessWidget {
  final bool obscureText;
  final String? svgPath;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final String? initialValue;
  final double? height;
  final double? width;
  final int? maxLines;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    this.obscureText = false,
    this.svgPath,
    this.labelText,
    this.hintText,
    this.errorText,
    this.initialValue,
    this.height = 24,
    this.width = 24,
    this.maxLines,
    this.keyboardType,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final apptheme = Theme.of(context);
    return TextFormField(
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      obscureText: obscureText,
      initialValue: initialValue,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        floatingLabelStyle: apptheme.textTheme.titleMedium,
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
