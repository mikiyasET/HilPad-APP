import 'package:flutter/material.dart';

// Color textColor = Color(0xffffffff);
// Color btnColor = Color(0xff28D8A1);
// Color fieldColor = Color(0xff212121);
// Color textGreyColor = Color(0xff8D8D8D);

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    primaryColor: Colors.red,
  );
  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Color(0xff0D0D0D),
    secondaryHeaderColor: Color(0xff212121),
    primaryColor: Colors.red,
  );
}
