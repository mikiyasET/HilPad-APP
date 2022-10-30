import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilpad/components/course_tile.dart';
import 'package:hilpad/controller/AuthController.dart';
import 'package:hilpad/controller/Controller.dart';
import 'package:hilpad/controller/HomePage.dart';
import 'package:hilpad/screens/shedule.dart';
import 'package:hilpad/services/ThemeService.dart';

class HomePage extends StatelessWidget {
  final HomePageController hc = Get.put(HomePageController());
  final Controller c = Get.put(Controller());
  final AuthController x = Get.put(AuthController());
  final ThemeController tc = Get.put(ThemeController());
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //drawer: const Drawer(),
        appBar: AppBar(
          title: const Text('HilPad'),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () => x.signOut(), icon: const Center(child: Icon(Icons.logout))),
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
        body: const SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Schedule(),
        ),
        bottomNavigationBar: Obx(() => BottomNavyBar(
              selectedIndex: c.selectedIndex.value,
              showElevation: true,
              itemCornerRadius: 24,
              curve: Curves.easeIn,
              onItemSelected: (index) => c.changePage(index),
              items: <BottomNavyBarItem>[
                BottomNavyBarItem(
                  icon: const Icon(Icons.apps),
                  title: const Text('Home'),
                  activeColor: tc.isDarkMode.value ? Colors.white : Colors.black,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: const Icon(Icons.people),
                  title: const Text('Users'),
                  activeColor: tc.isDarkMode.value ? Colors.white : Colors.black,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: const Icon(Icons.message),
                  title: const Text('Messages'),
                  activeColor: tc.isDarkMode.value ? Colors.white : Colors.black,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  activeColor: tc.isDarkMode.value ? Colors.white : Colors.black,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
      ),
    );
  }
}
