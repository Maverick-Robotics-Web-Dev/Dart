import 'package:bee_viajes_turismo/config/theme/color_scheme.dart';
import 'package:flutter/material.dart';

class AppTypography {
  static const String fontFamily = "Inter";

  static TextTheme textThemeLight = TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColorScheme.light.primary,
    ),

    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.light.primary,
    ),

    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: AppColorScheme.light.primary,
    ),

    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w400,
      color: AppColorScheme.light.primary,
    ),

    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w400,
      color: AppColorScheme.light.primary,
    ),

    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: AppColorScheme.light.primary,
    ),

    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.light.onSurface,
    ),

    titleMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.light.onSurface,
    ),

    titleSmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.light.onSurface,
    ),

    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColorScheme.light.onSurface,
    ),

    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColorScheme.light.onSurface.withValues(alpha: 0.8),
    ),

    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),

    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.light.secondary,
    ),

    labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),

    labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
  );

  static TextTheme textThemeDark = TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColorScheme.dark.primary,
    ),

    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.dark.primary,
    ),

    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.dark.primary,
    ),

    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w400,
      color: AppColorScheme.dark.primary,
    ),

    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w400,
      color: AppColorScheme.dark.primary,
    ),

    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: AppColorScheme.dark.primary,
    ),

    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),

    titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),

    titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),

    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColorScheme.dark.onSurface,
    ),

    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColorScheme.dark.onSurface.withValues(alpha: 0.8),
    ),

    bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),

    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.dark.secondary,
    ),

    labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),

    labelSmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
  );
}
