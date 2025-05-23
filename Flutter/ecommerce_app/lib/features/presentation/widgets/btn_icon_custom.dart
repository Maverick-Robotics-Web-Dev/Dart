import 'package:flutter/material.dart';

class BtnIconCustom extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final double? size;
  const BtnIconCustom({super.key, required this.icon, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(icon, color: color ?? Colors.white, size: size ?? 16),
    );
  }
}
