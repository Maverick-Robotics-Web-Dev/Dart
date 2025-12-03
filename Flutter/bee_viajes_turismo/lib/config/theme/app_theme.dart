import 'package:bee_viajes_turismo/config/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:bee_viajes_turismo/config/theme/tokens.dart';
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
      displayLarge: AppTypography.textThemeLight.displayLarge,
      displayMedium: AppTypography.textThemeLight.displayMedium,
      displaySmall: AppTypography.textThemeLight.displaySmall,
      headlineLarge: AppTypography.textThemeLight.headlineLarge,
      headlineMedium: AppTypography.textThemeLight.headlineMedium,
      headlineSmall: AppTypography.textThemeLight.headlineSmall,
      bodyLarge: AppTypography.textThemeLight.bodyLarge,
      bodyMedium: AppTypography.textThemeLight.bodyMedium,
      labelLarge: AppTypography.textThemeLight.labelLarge,
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
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusTokens.md),
      ),
      labelStyle: TextStyle(color: AppColorScheme.light.primary),
      focusColor: AppColorScheme.light.primary,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusTokens.md),
        borderSide: BorderSide(color: AppColorScheme.light.primary, width: 1.6),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusTokens.md),
        borderSide: BorderSide(color: AppColorScheme.light.error, width: 1.6),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(RadiusTokens.md),
        borderSide: BorderSide(color: AppColorScheme.light.error, width: 1.6),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColorScheme.light.primary;
        }
        return AppColorScheme.light.onPrimary;
      }),
      checkColor: WidgetStateProperty.all(AppColorScheme.light.onPrimary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(RadiusTokens.xs)),
      ),
      side: BorderSide(color: AppColorScheme.light.primary, width: 1.6),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: AppColorScheme.dark,
    scaffoldBackgroundColor: AppColorScheme.dark.surface,
    brightness: Brightness.dark,
    // Textos
    textTheme: TextTheme(
      displayLarge: AppTypography.textThemeDark.displayLarge,
      displayMedium: AppTypography.textThemeDark.displayMedium,
      displaySmall: AppTypography.textThemeDark.displaySmall,
      headlineLarge: AppTypography.textThemeDark.headlineLarge,
      headlineMedium: AppTypography.textThemeDark.headlineMedium,
      headlineSmall: AppTypography.textThemeDark.headlineSmall,
      titleLarge: AppTypography.textThemeLight.titleLarge,
      titleMedium: AppTypography.textThemeLight.titleMedium,
      titleSmall: AppTypography.textThemeLight.titleSmall,
      bodyLarge: AppTypography.textThemeDark.bodyLarge,
      bodyMedium: AppTypography.textThemeDark.bodyMedium,
      labelLarge: AppTypography.textThemeDark.labelLarge,
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
