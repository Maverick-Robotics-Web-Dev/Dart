import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';

CheckboxThemeData chkboxTheme = CheckboxThemeData(
  checkColor: WidgetStateProperty.all(Colors.white),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(borderRadious_12 / 2)),
  ),
  side: const BorderSide(color: whileColor40),
);
