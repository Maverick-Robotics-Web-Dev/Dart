import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';

CheckboxThemeData chkboxTheme = CheckboxThemeData(
  fillColor: WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.selected)) {
      return primaryColor;
    }
    return inputBackgroundColor;
  }),
  checkColor: WidgetStateProperty.all(Colors.white),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(4)),
  ),
  side: const BorderSide(color: whileColor40, width: 1.6),
);
