import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/config/theme/input_decoration_theme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme(BuildContext context) => ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.light,
  ),
  // brightness: Brightness.light,
  fontFamily: "Plus Jakarta",
  scaffoldBackgroundColor: Colors.white,
  iconTheme: IconThemeData(color: primaryColor),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: hintTextColor, fontWeight: FontWeight.w500),
    headlineSmall: TextStyle(color: textColor),
  ),
  inputDecorationTheme: lightInputDecorationTheme,
);
