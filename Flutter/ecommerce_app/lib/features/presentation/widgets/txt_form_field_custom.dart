import 'package:flutter/material.dart';

class TxtFormFieldCustom extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function(String) onChanged;
  final Color? color;
  final String? errorText;
  final bool? obscureText;
  final String? initialValue;
  final String? Function(String?)? validator;

  const TxtFormFieldCustom({
    super.key,
    required this.label,
    required this.icon,
    required this.onChanged,
    this.color = Colors.white,
    this.errorText,
    this.obscureText,
    this.initialValue,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      initialValue: initialValue,
      onChanged: (text) {
        // if (onChanged != null) {
        //   onChanged(text);
        // }
        onChanged(text);
      },
      validator: validator,
      decoration: InputDecoration(
        label: Text(label, style: TextStyle(color: color)),
        errorText: errorText,
        prefixIcon: Icon(icon, color: color),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color!),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color!),
        ),
      ),
      style: TextStyle(color: color),
    );
  }
}
