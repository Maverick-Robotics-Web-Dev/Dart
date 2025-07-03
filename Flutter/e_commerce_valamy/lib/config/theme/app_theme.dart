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
    headlineLarge: TextStyle(color: primaryColor, letterSpacing: 1),
    bodyLarge: TextStyle(color: textColor, letterSpacing: 1),
  ),
  elevatedButtonTheme: elevatedBtnTheme,
  textButtonTheme: txtButtonTheme,
  inputDecorationTheme: lightInputDecorationTheme,
);
