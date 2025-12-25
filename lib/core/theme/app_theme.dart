import 'package:flutter/material.dart';
import 'part/elevated_button_theme.dart';
import 'part/input_decoration_theme.dart';
import 'theme_extension/color_scheme.dart';
import 'theme_extension/text_theme.dart';

class AppTheme{
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColorScheme.scaffoldBackgroundColor,
    textTheme: AppTextTheme.lightTextTheme,
    colorScheme: AppColorScheme.lightColorScheme,
    inputDecorationTheme: AppInputDecorationTheme.lightInputDecorationTheme,
    elevatedButtonTheme: AppEvaluatedButtonThemes.lightEvaluatedButtonTheme
  );
}