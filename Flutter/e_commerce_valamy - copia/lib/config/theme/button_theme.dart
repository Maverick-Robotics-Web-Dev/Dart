import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';

ElevatedButtonThemeData elevatedBtnTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.all(h_16),
    backgroundColor: primaryColor,
    foregroundColor: whiteColor,
    // minimumSize: Size(double.infinity, 32),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadious_12)),
    ),
  ),
);

TextButtonThemeData txtButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(foregroundColor: primaryColor),
);
