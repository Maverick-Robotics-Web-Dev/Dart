import 'package:e_commerce_valamy/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

TextStyle textResponsiveWhite(BuildContext context) => TextStyle(
  fontSize:
      ResponsiveValue<double>(
        context,
        conditionalValues: [
          // Condition.equals(name: 'SMALL_MOBILE', value: 8),
          Condition.equals(name: MOBILE, value: 18),
          Condition.equals(name: TABLET, value: 18),
          Condition.equals(name: DESKTOP, value: 14),
          Condition.equals(name: '4K', value: 14),
        ],
        defaultValue: 10,
      ).value,
  color: whiteColor,
);

TextStyle textResponsiveBlack(BuildContext context) => TextStyle(
  fontSize:
      ResponsiveValue<double>(
        context,
        conditionalValues: [
          Condition.equals(name: 'SMALL_MOBILE', value: 8),
          Condition.equals(name: MOBILE, value: 10),
          Condition.equals(name: TABLET, value: 12),
          Condition.equals(name: DESKTOP, value: 14),
          Condition.equals(name: '4K', value: 16),
        ],
        defaultValue: 10,
      ).value,
  color: blackColor,
);
