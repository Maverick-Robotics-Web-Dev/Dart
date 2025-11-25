import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';

class SwitchWithLabel extends StatelessWidget {
  final String text;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SwitchWithLabel({
    super.key,
    required this.text,
    this.value = false,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            color: primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Transform.scale(
          scale: 1.2,
          child: Switch(
            value: value,
            onChanged: onChanged,
            activeTrackColor: primaryColor,
            inactiveThumbColor: hintTextColor,
            inactiveTrackColor: whiteColor,
            trackOutlineColor: WidgetStateProperty.all(hintTextColor),
          ),
        ),
      ],
    );
  }
}
