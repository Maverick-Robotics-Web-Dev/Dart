import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';

const InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
  fillColor: inputBackgroundColor,
  filled: true,
  hintStyle: TextStyle(color: hintTextColor),
  border: outlineInputBorder,
  enabledBorder: outlineInputBorder,
  focusedBorder: focusedOutlineInputBorder,
  errorBorder: errorOutlineInputBorder,
);

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadious)),
  borderSide: BorderSide(color: borderColor),
);

const OutlineInputBorder focusedOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadious)),
  borderSide: BorderSide(color: primaryColor, width: 1.4),
);

const OutlineInputBorder errorOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadious)),
  borderSide: BorderSide(color: warningColor),
);
