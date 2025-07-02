import 'package:e_commerce_valamy/config/constants.dart';
import 'package:e_commerce_valamy/config/theme/button_theme.dart';
import 'package:e_commerce_valamy/config/theme/input_theme.dart';
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
    bodyMedium: TextStyle(color: hintTextColor, fontSize: 14.6),
    headlineSmall: TextStyle(color: textColor),
  ),
  elevatedButtonTheme: elevatedBtnTheme,
  textButtonTheme: txtButtonTheme,
  inputDecorationTheme: lightInputDecorationTheme,
);
