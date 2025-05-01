import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function(String text) onChange;
  final EdgeInsetsGeometry? margin;
  final Color? backdrop;
  final String? Function(String?)? validator;

  const TextFormFieldWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.onChange,
    this.margin = const EdgeInsets.all(0),
    this.backdrop = Colors.white,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 50,
      decoration: BoxDecoration(
        color: backdrop,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: TextFormField(
        onChanged: (text) {
          onChange(text);
        },
        validator: validator,
        decoration: InputDecoration(
          label: Text(text),
          border: InputBorder.none,
          prefixIcon: Container(
            margin: EdgeInsets.only(top: 12),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: [
                Icon(icon),
                Container(height: 20, width: 1, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
