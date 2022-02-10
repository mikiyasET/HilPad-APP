import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// class ThemeService extends GetxController {
//   final _box = GetStorage();
//   final _key = 'isDarkMode';
//
//   /// Get isDarkMode info from local storage and return ThemeMode
//   ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;
//
//   bool get isDark => _loadThemeFromBox() ? true : false;
//
//   /// Load isDArkMode from local storage and if it's empty, returns false (that means default theme is light)
//   bool _loadThemeFromBox() => _box.read(_key) ?? false;
//
//   /// Save isDarkMode to local storage
//   _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);
//
//   /// Switch theme and save to local storage
//   void switchTheme() {
//     Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
//     _saveThemeToBox(!_loadThemeFromBox());
//   }
// }
class ThemeController extends GetxController {
  @override
  void onInit() {
    isDarkMode = (_loadThemeFromBox() ? true : false).obs;
  }

  final _box = GetStorage();
  final _key = 'isDarkMode';
  var isDarkMode = true.obs;
  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;
  bool _loadThemeFromBox() => _box.read(_key) ?? false;
  _saveThemeToBox(bool isDark) => _box.write(_key, isDark);
  void toggleDarkMode() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());

    update();
  }
}
