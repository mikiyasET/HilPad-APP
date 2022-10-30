import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hilpad/Bindings/AuthBinding.dart';
import 'package:hilpad/screens/Home.dart';
import 'package:hilpad/screens/login.dart';
import 'package:hilpad/screens/signup.dart';
import 'package:hilpad/services/ThemeService.dart';
import 'package:hilpad/utils/Theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      routes: {
        '/': (context) => const Home(),
        '/login': (context) => Login(),
        '/signup': (context) => Signup(),
      },
      title: 'HilPad',
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeController().theme,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
