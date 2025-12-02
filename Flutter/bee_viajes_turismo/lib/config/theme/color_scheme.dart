import 'package:flutter/material.dart';

// class AppColorScheme {
//   static final ColorScheme light = ColorScheme(
//     brightness: Brightness.light,
//     primary: AppTonalPalette.tone(6),
//     onPrimary: AppTonalPalette.tone(0),
//     primaryContainer: AppTonalPalette.tone(2),
//     onPrimaryContainer: AppTonalPalette.tone(10),

//     secondary: AppTonalPalette.tone(5),
//     onSecondary: AppTonalPalette.tone(0),
//     secondaryContainer: AppTonalPalette.tone(1),
//     onSecondaryContainer: AppTonalPalette.tone(11),

//     tertiary: AppTonalPalette.tone(7),
//     onTertiary: AppTonalPalette.tone(0),
//     tertiaryContainer: AppTonalPalette.tone(2),
//     onTertiaryContainer: AppTonalPalette.tone(11),

//     error: Colors.red.shade700,
//     onError: Colors.white,
//     errorContainer: Colors.red.shade100,
//     onErrorContainer: Colors.red.shade900,
//     surface: AppTonalPalette.tone(0),
//     onSurface: AppTonalPalette.tone(12),
//     surfaceContainerHighest: AppTonalPalette.tone(1),
//     onSurfaceVariant: AppTonalPalette.tone(11),

//     outline: AppTonalPalette.tone(9),
//     shadow: Colors.black,
//     inverseSurface: AppTonalPalette.tone(12),
//     onInverseSurface: AppTonalPalette.tone(0),
//     inversePrimary: AppTonalPalette.tone(8),
//     surfaceTint: AppTonalPalette.tone(6),
//   );

//   static final ColorScheme dark = ColorScheme(
//     brightness: Brightness.dark,
//     primary: AppTonalPalette.tone(8),
//     onPrimary: AppTonalPalette.tone(0),
//     primaryContainer: AppTonalPalette.tone(10),
//     onPrimaryContainer: AppTonalPalette.tone(2),

//     secondary: AppTonalPalette.tone(7),
//     onSecondary: AppTonalPalette.tone(0),
//     secondaryContainer: AppTonalPalette.tone(9),
//     onSecondaryContainer: AppTonalPalette.tone(1),

//     tertiary: AppTonalPalette.tone(9),
//     onTertiary: AppTonalPalette.tone(0),
//     tertiaryContainer: AppTonalPalette.tone(11),
//     onTertiaryContainer: AppTonalPalette.tone(2),

//     error: Colors.red.shade400,
//     onError: Colors.white,
//     errorContainer: Colors.red.shade900,
//     onErrorContainer: Colors.red.shade100,
//     surface: AppTonalPalette.tone(12),
//     onSurface: AppTonalPalette.tone(0),
//     surfaceContainerHighest: AppTonalPalette.tone(10),
//     onSurfaceVariant: AppTonalPalette.tone(2),

//     outline: AppTonalPalette.tone(5),
//     shadow: Colors.black,
//     inverseSurface: AppTonalPalette.tone(0),
//     onInverseSurface: AppTonalPalette.tone(12),
//     inversePrimary: AppTonalPalette.tone(6),
//     surfaceTint: AppTonalPalette.tone(8),
//   );
// }

class AppColorScheme {
  static final ColorScheme light = ColorScheme(
    brightness: Brightness.light,

    primary: Color(0xFF08296C),
    onPrimary: Colors.white,
    primaryContainer: Color(0xFF2E509D),
    onPrimaryContainer: Colors.white,

    secondary: Color(0xFFFFB400),
    onSecondary: Colors.black,
    secondaryContainer: Color(0xFFFFD980),
    onSecondaryContainer: Colors.black,

    tertiary: Color(0xFF0A6A8C),
    onTertiary: Colors.white,
    tertiaryContainer: Color(0xFF8BD2E4),
    onTertiaryContainer: Colors.black,

    error: Color(0xFFD32F2F),
    onError: Colors.white,
    errorContainer: Color(0xFFFFCDD2),
    onErrorContainer: Colors.black,

    surface: Colors.white,
    onSurface: Color(0xFF1D1F24),

    surfaceContainerHighest: Color(0xFFE1E6F1),
    onSurfaceVariant: Color(0xFF2F3540),

    outline: Color(0xFF8497C5),
    shadow: Colors.black,
  );

  static final ColorScheme dark = ColorScheme(
    brightness: Brightness.dark,

    primary: Color(0xFF5877B0), // Elevado para legibilidad
    onPrimary: Colors.black,
    primaryContainer: Color(0xFF08296C),
    onPrimaryContainer: Colors.white,

    secondary: Color(0xFFFFC94D), // Acento suave cálido
    onSecondary: Colors.black,
    secondaryContainer: Color(0xFF806300),
    onSecondaryContainer: Colors.white,

    tertiary: Color(0xFF4EB6CE),
    onTertiary: Colors.black,
    tertiaryContainer: Color(0xFF0A6A8C),
    onTertiaryContainer: Colors.white,

    error: Color(0xFFE57373),
    onError: Colors.black,
    errorContainer: Color(0xFFD32F2F),
    onErrorContainer: Colors.white,

    surface: Color(0xFF12141A),
    onSurface: Color(0xFFE3E6EB),

    surfaceContainerHighest: Color(0xFF2F3540),
    onSurfaceVariant: Color(0xFFD0D4DC),

    outline: Color(0xFF5F6B7A),
    shadow: Colors.black,
  );
}
