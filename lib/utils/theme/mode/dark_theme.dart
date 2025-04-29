import 'package:flutter/material.dart';

class DarkTheme {
  static const _primary = Colors.red;
  static const _secondary = Color(0xFFbae162);
  static const _surface = Color(0xFF28292B);
  static const _error = Color(0xFFCF6679);

  static const _onPrimary = Color(0xFFFFFFFF);
  static const _onSecondary = Color(0xFF000000);
  static const _onSurface = Color(0xFFFFFFFF);
  static const _onError = Color(0xFF000000);

  static const _appBarTheme = AppBarTheme(
    color: _primary,
    elevation: 4,
    iconTheme: IconThemeData(color: _onPrimary),
    titleTextStyle: TextStyle(
      color: _onPrimary,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    toolbarTextStyle: TextStyle(
      color: _onPrimary,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  );

  static ThemeData theme() => ThemeData.dark().copyWith(
        primaryColor: _primary,
        scaffoldBackgroundColor: _surface,
        appBarTheme: _appBarTheme,
        dividerColor: _onSurface.withValues(alpha: .05),
        colorScheme: const ColorScheme(
          primary: _primary,
          secondary: _secondary,
          surface: _surface,
          error: _error,
          onPrimary: _onPrimary,
          onSecondary: _onSecondary,
          onSurface: _onSurface,
          onError: _onError,
          brightness: Brightness.dark,
        ),
      );
}
