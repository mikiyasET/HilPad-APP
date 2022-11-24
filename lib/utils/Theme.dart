import 'package:flutter/material.dart';

// Color textColor = Color(0xffffffff);
// Color btnColor = Color(0xff28D8A1);
// Color fieldColor = Color(0xff212121);
// Color textGreyColor = Color(0xff8D8D8D);

class Themes {
  static final light = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.red,
      backgroundColor: Colors.red,
      accentColor: Colors.red,
      cardColor: Colors.red,
    ),
    backgroundColor: Colors.white,
    secondaryHeaderColor: Colors.red,
    primaryColor: Colors.red,
    primaryColorLight: Colors.red,
    primaryColorDark: Color(0xff222325),
    brightness: Brightness.light,
  );
  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Color(0xff28292B), // 0XFF28292B
    backgroundColor: Color(0xff222325), // 0XFF0D0D0D
    secondaryHeaderColor: Color(0xff222325), // 0XFF212121
    primaryColor: Colors.red,
    primaryColorLight: Colors.red,
    primaryColorDark: Colors.red,
    brightness: Brightness.dark,
  );
}
