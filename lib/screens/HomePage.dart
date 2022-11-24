import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilpad/controller/Controller.dart';
import 'package:hilpad/controller/HomePage.dart';
import 'package:hilpad/screens/courseFiles.dart';
import 'package:hilpad/screens/examFiles.dart';
import 'package:hilpad/screens/settings.dart';
import 'package:hilpad/screens/shedule.dart';
import 'package:hilpad/services/ThemeService.dart';

class HomePage extends StatelessWidget {
  final PageController controller = PageController();
  final HomePageController hc = Get.put(HomePageController());
  final Controller c = Get.put(Controller());
  final ThemeController tc = Get.put(ThemeController());
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //drawer: const Drawer(),
        body: PageView(
            controller: controller,
            onPageChanged: (index) => c.changePage(index),
            children: [
              SingleChildScrollView(
                  physics: ClampingScrollPhysics(), child: Schedule()),
              SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: CourseFilesPage()),
              SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ExamFilesPage()),
              SettingsPage()
            ]),
        bottomNavigationBar: Obx(() => BottomNavyBar(
              selectedIndex: c.selectedIndex.value,
              showElevation: true,
              itemCornerRadius: 24,
              curve: Curves.easeIn,
              onItemSelected: (index) {
                c.changePage(index);
                controller.jumpToPage(index);
              },
              items: <BottomNavyBarItem>[
                BottomNavyBarItem(
                  icon: const Icon(Icons.apps),
                  title: const Text('Home'),
                  activeColor:
                      tc.isDarkMode.value ? Colors.white : Colors.black,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: const Icon(Icons.book),
                  title: const Text('Files'),
                  activeColor:
                      tc.isDarkMode.value ? Colors.white : Colors.black,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: const Icon(Icons.perm_media),
                  title: const Text('Exams'),
                  activeColor:
                      tc.isDarkMode.value ? Colors.white : Colors.black,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  activeColor:
                      tc.isDarkMode.value ? Colors.white : Colors.black,
                  textAlign: TextAlign.center,
                ),
              ],
            )),
      ),
    );
  }
}
