import 'package:flutter/material.dart';

class TxtFormFieldCustom extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function(String) onChanged;
  final String? Function(String?)? validator;
  final String? errorText;
  final bool? obscureText;

  const TxtFormFieldCustom({
    super.key,
    required this.label,
    required this.icon,
    required this.onChanged,
    this.validator,
    this.errorText,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      onChanged: (text) {
        // if (onChanged != null) {
        //   onChanged(text);
        // }
        onChanged(text);
      },
      validator: validator,
      decoration: InputDecoration(
        label: Text(label, style: TextStyle(color: Colors.white)),
        errorText: errorText,
        prefixIcon: Icon(icon, color: Colors.white),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      style: TextStyle(color: Colors.white),
    );
  }
}
