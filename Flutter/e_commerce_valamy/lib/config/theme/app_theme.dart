import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme(BuildContext context) => ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF0D47A1)),
  fontFamily: "Plus Jakarta",
  textTheme: const TextTheme(bodyMedium: TextStyle(color: blackColor40)),
);
