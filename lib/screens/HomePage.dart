import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilpad/controller/AuthController.dart';
import 'package:hilpad/controller/Controller.dart';
import 'package:hilpad/controller/HomePage.dart';
import 'package:hilpad/services/ThemeService.dart';

import '../models/User.dart';

class HomePage extends StatelessWidget {
  final HomePageController hc = Get.put(HomePageController());
  final Controller c = Get.put(Controller());
  final AuthController x = Get.put(AuthController());
  final ThemeController tc = Get.put(ThemeController());
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GetBuilder<ThemeController>(
                            builder: (controller) => IconButton(
                              icon: Icon(
                                controller.isDarkMode.value
                                    ? Icons.wb_sunny
                                    : Icons.dark_mode,
                              ),
                              onPressed: () => controller.toggleDarkMode(),
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 0),
                            leading: CircleAvatar(
                              backgroundImage:
                                  Image.network((x.user?.photoURL).toString())
                                      .image,
                              maxRadius: 30,
                            ),
                            title: Text((x.user?.displayName).toString()),
                            subtitle: Text((x.user?.email).toString()),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.schedule_outlined),
                    title: Text("Schedule"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.book),
                    title: Text("Course"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Settings"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.developer_mode_outlined),
                    title: Text("Developer"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.apps),
                    title: Text("Other Apps"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Column(
                  children: const [
                    Text(
                      "Powered by Codeabay",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Version 1.0",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('HilPad'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => x.signOut(), icon: Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  //
                  return Text(
                    snapshot.data.toString(),
                    style: TextStyle(fontSize: 20),
                  );
                } else {
                  return Text("Loading...");
                }
              },
              stream: readUsers(),
            ),
            // Obx(() =>
            //     Text("${x.user?.displayName} ${x.user?.uid} ${tc.isDarkMode} "))
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
                icon: Icon(Icons.home_outlined),
                title: Text('Home'),
                activeColor: tc.isDarkMode.value ? Colors.white : Colors.black,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.local_library_outlined),
                title: Text('Materials'),
                activeColor: tc.isDarkMode.value ? Colors.white : Colors.black,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: Icon(Icons.table_chart_outlined),
                title: Text('News Board'),
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

  Stream<List<User>> readUsers() =>
      FirebaseFirestore.instance.collection('users').snapshots().map(
            (snapshot) => snapshot.docs
                .map(
                  (docs) => User.fromJson(
                    docs.data(),
                  ),
                )
                .toList(),
          );
}
