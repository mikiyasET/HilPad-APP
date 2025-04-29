import 'package:flutter/material.dart';

class LightTheme {
  static const _primary = Colors.red;
  static const _secondary = Color(0xFFbae162);
  static const _surface = Color(0xFFFFFFFF);
  static const _error = Color(0xFFB00020);

  static const _onPrimary = Color(0xFFFFFFFF);
  static const _onSecondary = Color(0xFF000000);
  static const _onSurface = Color(0xFF000000);
  static const _onError = Color(0xFFFFFFFF);

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

  static ThemeData theme() => ThemeData.light().copyWith(
        primaryColor: _primary,
        scaffoldBackgroundColor: _surface,
        appBarTheme: _appBarTheme,
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: Colors.red,
          contentTextStyle: TextStyle(color: Colors.white),
        ),
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
          brightness: Brightness.light,
        ),
        cardColor: Colors.red,
      );
}
// import 'package:flutter/material.dart';
//
// // Color textColor = Color(0xffffffff);
// // Color btnColor = Color(0xff28D8A1);
// // Color fieldColor = Color(0xff212121);
// // Color textGreyColor = Color(0xff8D8D8D);
//
// class Themes {
//   static final light = ThemeData.light().copyWith(
//     colorScheme: ColorScheme.fromSwatch(
//       primarySwatch: Colors.red,
//       backgroundColor: Colors.white,
//       accentColor: Colors.red,
//       cardColor: Colors.red,
//     ),
//     snackBarTheme: const SnackBarThemeData(
//       backgroundColor: Colors.red,
//       contentTextStyle: TextStyle(color: Colors.white),
//     ),
//     secondaryHeaderColor: Colors.red,
//     primaryColor: Colors.red,
//     primaryColorLight: Colors.black,
//     primaryColorDark: Color(0xff222325),
//     brightness: Brightness.light,
//   );
//   static final dark = ThemeData.dark().copyWith(
//     snackBarTheme: const SnackBarThemeData(
//       backgroundColor: Color(0xff222325),
//       contentTextStyle: TextStyle(color: Colors.white),
//     ),
//     scaffoldBackgroundColor: Color(0xff28292B),
//     // 0XFF28292B
//     // 0XFF0D0D0D
//     secondaryHeaderColor: Color(0xff222325),
//     // 0XFF212121
//     primaryColor: Colors.red,
//     primaryColorLight: Colors.white,
//     primaryColorDark: Colors.red,
//     brightness: Brightness.dark,
//   );
// }
