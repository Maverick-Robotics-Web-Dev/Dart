import 'package:flutter/material.dart';

class BtnElevatedCustom extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? backgroundColor;
  final Color? color;

  const BtnElevatedCustom({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? Colors.white,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color ?? Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
