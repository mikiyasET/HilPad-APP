import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilpad/controller/AuthController.dart';
import 'package:hilpad/controller/Controller.dart';
import 'package:hilpad/controller/HomePage.dart';
import 'package:hilpad/services/ThemeService.dart';

class HomePage extends StatelessWidget {
  final HomePageController hc = Get.put(HomePageController());
  final Controller c = Get.put(Controller());
  final AuthController x = Get.put(AuthController());
  final ThemeController tc = Get.put(ThemeController());
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text('HilPad'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => x.signOut(), icon: Icon(Icons.logout)),
          GetBuilder<ThemeController>(
            builder: (controller) => IconButton(
              icon: Icon(
                controller.isDarkMode.value ? Icons.wb_sunny : Icons.dark_mode,
              ),
              onPressed: () => controller.toggleDarkMode(),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text("${x.user} ${x.user} ${tc.isDarkMode} "))
          ],
        ),
      ),
      bottomNavigationBar: Obx(() => BottomNavyBar(
            selectedIndex: c.selectedIndex.value,
            showElevation: true,
            itemCornerRadius: 24,
            curve: Curves.easeIn,
            onItemSelected: (index) => c.changePage(index),
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: Icon(Icons.apps),
                title: Text('Home'),
                activeColor: tc.isDarkMode.value ? Colors.white : Colors.black,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.people),
                title: Text('Users'),
                activeColor: tc.isDarkMode.value ? Colors.white : Colors.black,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.message),
                title: Text('Messages'),
                activeColor: tc.isDarkMode.value ? Colors.white : Colors.black,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
                activeColor: tc.isDarkMode.value ? Colors.white : Colors.black,
                textAlign: TextAlign.center,
              ),
            ],
          )),
    );
  }
}
