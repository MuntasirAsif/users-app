import 'package:flutter/material.dart';

extension AppThemeColorScheme on BuildContext {
  ColorScheme get colorScheme => AppColorScheme.lightColorScheme;
}

class AppColorScheme {
  // Brand Colors
  static const Color primaryColor = Color(0xFF3F51B5); 
  static const Color secondaryColor = Color(0xFF26A69A);
  static const Color accentColor = Color(0xFFFFC107); 

  // Background & Surface
  static const Color scaffoldBackgroundColor = Color(0xFFF6F7FB);
  static const Color surfaceColor = Color(0xFFFFFFFF);

  // UI Elements
  static const Color buttonColor = Color(0xFF3F51B5);
  static const Color borderColor = Color(0xFFE0E0E0);

  // Text
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFF00332F);
  static const Color onSurface = Color(0xFF333333);
  static const Color hintTextColor = Color(0xFF9E9E9E);

  // Status Colors
  static const Color successColor = Color(0xFF4CAF50);
  static const Color errorColor = Color(0xFFE53935);
  static const Color warningColor = Color(0xFFFF9800);

  static final ColorScheme lightColorScheme = ColorScheme.light(
    primary: primaryColor,
    secondary: secondaryColor,
    surface: surfaceColor,
    background: scaffoldBackgroundColor,
    error: errorColor,

    onPrimary: onPrimary,
    onSecondary: onSecondary,
    onSurface: onSurface,
    onBackground: onSurface,
    onError: onPrimary,

    brightness: Brightness.light,
  );
}
