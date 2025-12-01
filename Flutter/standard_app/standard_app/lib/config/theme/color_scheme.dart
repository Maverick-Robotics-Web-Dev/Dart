import 'package:flutter/material.dart';
import 'package:standard_app/config/theme/app_colors.dart';

class AppColorScheme {
  static final ColorScheme light = ColorScheme(
    brightness: Brightness.light,
    primary: AppTonalPalette.tone(6),
    onPrimary: AppTonalPalette.tone(0),
    primaryContainer: AppTonalPalette.tone(2),
    onPrimaryContainer: AppTonalPalette.tone(10),

    secondary: AppTonalPalette.tone(5),
    onSecondary: AppTonalPalette.tone(0),
    secondaryContainer: AppTonalPalette.tone(1),
    onSecondaryContainer: AppTonalPalette.tone(11),

    tertiary: AppTonalPalette.tone(7),
    onTertiary: AppTonalPalette.tone(0),
    tertiaryContainer: AppTonalPalette.tone(2),
    onTertiaryContainer: AppTonalPalette.tone(11),

    error: Colors.red.shade700,
    onError: Colors.white,
    errorContainer: Colors.red.shade100,
    onErrorContainer: Colors.red.shade900,
    surface: AppTonalPalette.tone(0),
    onSurface: AppTonalPalette.tone(12),
    surfaceContainerHighest: AppTonalPalette.tone(1),
    onSurfaceVariant: AppTonalPalette.tone(11),

    outline: AppTonalPalette.tone(9),
    shadow: Colors.black,
    inverseSurface: AppTonalPalette.tone(12),
    onInverseSurface: AppTonalPalette.tone(0),
    inversePrimary: AppTonalPalette.tone(8),
    surfaceTint: AppTonalPalette.tone(6),
  );

  static final ColorScheme dark = ColorScheme(
    brightness: Brightness.dark,
    primary: AppTonalPalette.tone(8),
    onPrimary: AppTonalPalette.tone(0),
    primaryContainer: AppTonalPalette.tone(10),
    onPrimaryContainer: AppTonalPalette.tone(2),

    secondary: AppTonalPalette.tone(7),
    onSecondary: AppTonalPalette.tone(0),
    secondaryContainer: AppTonalPalette.tone(9),
    onSecondaryContainer: AppTonalPalette.tone(1),

    tertiary: AppTonalPalette.tone(9),
    onTertiary: AppTonalPalette.tone(0),
    tertiaryContainer: AppTonalPalette.tone(11),
    onTertiaryContainer: AppTonalPalette.tone(2),

    error: Colors.red.shade400,
    onError: Colors.white,
    errorContainer: Colors.red.shade900,
    onErrorContainer: Colors.red.shade100,
    surface: AppTonalPalette.tone(12),
    onSurface: AppTonalPalette.tone(0),
    surfaceContainerHighest: AppTonalPalette.tone(10),
    onSurfaceVariant: AppTonalPalette.tone(2),

    outline: AppTonalPalette.tone(5),
    shadow: Colors.black,
    inverseSurface: AppTonalPalette.tone(0),
    onInverseSurface: AppTonalPalette.tone(12),
    inversePrimary: AppTonalPalette.tone(6),
    surfaceTint: AppTonalPalette.tone(8),
  );
}
