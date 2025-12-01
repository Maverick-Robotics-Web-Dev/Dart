import 'package:flutter/material.dart';
import 'package:standard_app/config/theme/tokens.dart';
import 'color_scheme.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    colorScheme: AppColorScheme.light,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColorScheme.light.surface,
    // Iconos
    iconTheme: IconThemeData(
      color: AppColorScheme.light.primary,
      size: IconsTokens.md,
    ),
    // Textos
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColorScheme.light.primary,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: AppColorScheme.light.primary,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: AppColorScheme.light.onSurface),
      bodyMedium: TextStyle(
        fontSize: 14,
        // color: AppColorScheme.light.onSurface.withOpacity(0.8),
        color: AppColorScheme.light.onSurface.withValues(alpha: 0.8),
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColorScheme.light.secondary,
      ),
    ),
    // Botones
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorScheme.light.primary,
        foregroundColor: AppColorScheme.light.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RadiusTokens.md),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColorScheme.light.secondary,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColorScheme.light.secondary),
        foregroundColor: AppColorScheme.light.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RadiusTokens.md),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    ),
    // Cards
    cardTheme: CardThemeData(
      color: AppColorScheme.light.surface,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RadiusTokens.md),
      ),
      shadowColor: AppColorScheme.light.shadow,
    ),
    // TextFields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColorScheme.light.surfaceContainerHighest,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusTokens.md),
        borderSide: BorderSide(color: AppColorScheme.light.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusTokens.md),
        borderSide: BorderSide(color: AppColorScheme.light.primary),
      ),
      labelStyle: TextStyle(color: AppColorScheme.light.secondary),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: AppColorScheme.dark,
    scaffoldBackgroundColor: AppColorScheme.dark.surface,
    brightness: Brightness.dark,
    // Textos
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColorScheme.dark.primary,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: AppColorScheme.dark.primary,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: AppColorScheme.dark.onSurface),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: AppColorScheme.dark.onSurface.withValues(alpha: 0.8),
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColorScheme.dark.secondary,
      ),
    ),
    // Iconos
    iconTheme: IconThemeData(color: AppColorScheme.dark.primary, size: 24),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorScheme.dark.primary,
        foregroundColor: AppColorScheme.dark.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RadiusTokens.md),
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColorScheme.dark.secondary,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: AppColorScheme.dark.secondary),
        foregroundColor: AppColorScheme.dark.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RadiusTokens.md),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    ),

    cardTheme: CardThemeData(
      color: AppColorScheme.dark.surface,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RadiusTokens.md),
      ),
      shadowColor: AppColorScheme.dark.shadow,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColorScheme.dark.surfaceContainerHighest,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusTokens.md),
        borderSide: BorderSide(color: AppColorScheme.dark.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusTokens.md),
        borderSide: BorderSide(color: AppColorScheme.dark.primary),
      ),
      labelStyle: TextStyle(color: AppColorScheme.dark.secondary),
    ),
  );
}
