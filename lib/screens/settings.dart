import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hilpad/controller/SettingsController.dart';
import 'package:hilpad/helper/SettingsHelper.dart';
import 'package:hilpad/models/batch.dart';
import 'package:hilpad/models/student.dart';
import 'package:hilpad/models/user.dart';
import 'package:hilpad/utils/universal_helper_functions.dart';

import '../controller/AuthController.dart';
import '../services/ThemeService.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);
  final AuthController x = Get.find<AuthController>();
  final ThemeController tc = Get.put(ThemeController());
  final SettingsController sc = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SettingHelper(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return futureBuilderBase(
            context,
            snapshot,
            body: Builder(
              builder: (BuildContext context) {
                User user = snapshot.data[0];
                Student student = snapshot.data[1];
                Batch batch = snapshot.data[2];
                sc.setBatch(batch.code);
                sc.setSection(student.section);
                sc.changeText();
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(100),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: tc.isDarkMode.value
                                          ? Theme.of(context)
                                              .scaffoldBackgroundColor
                                          : Colors.redAccent,
                                      borderRadius: BorderRadius.circular(70)),
                                  child: Center(
                                    child: Text(user.name.toString()[0],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Obx(
                                        () => Text(
                                          sc.batchSection.value,
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            user.name.toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 19,
                                            ),
                                          ),
                                          SizedBox(width: 6),
                                          Icon(
                                            Icons.verified,
                                            color: tc.isDarkMode.value
                                                ? Colors.blue
                                                : Colors.white,
                                            size: 18,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Material(
                                  elevation: tc.isDarkMode.value ? 0 : 0,
                                  color: tc.isDarkMode.value
                                      ? Theme.of(context)
                                          .scaffoldBackgroundColor
                                      : Colors.redAccent,
                                  borderRadius: BorderRadius.circular(10),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.edit,
                                          size: 20, color: Colors.white)),
                                )
                              ],
                            ),
                          ),
                        ),
                        pinned: true,
                        backgroundColor: Theme.of(context).secondaryHeaderColor,
                        expandedHeight: 180,
                        title: const Padding(
                          padding: const EdgeInsets.only(left: 10, top: 20),
                          child: Text("Settings"),
                        ),
                        titleTextStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                            fontWeight: FontWeight.bold),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          height: MediaQuery.of(context).size.height - 265,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () => Get.toNamed('/telegram'),
                                title: const Text(
                                  'Connect to Telegram',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                trailing:
                                    Icon(Icons.cloud_done_rounded, size: 14),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                              ),
                              const Divider(),
                              ListTile(
                                onTap: () => Get.toNamed("/changeBatch"),
                                title: const Text(
                                  'Change Batch',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                trailing:
                                    Icon(Icons.arrow_forward_ios, size: 14),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                              ),
                              Divider(),
                              ListTile(
                                onTap: () {
                                  Get.toNamed('/changePassword');
                                },
                                title: const Text(
                                  'Change Password',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                trailing:
                                    Icon(Icons.arrow_forward_ios, size: 14),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                              ),
                              const Divider(),
                              ListTile(
                                title: const Text(
                                  "Dark Mode",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                trailing: Switch(
                                    activeColor: Theme.of(context).primaryColor,
                                    value: tc.isDarkMode.value,
                                    onChanged: (value) {
                                      tc.toggleDarkMode();
                                      SystemChrome.setSystemUIOverlayStyle(
                                        SystemUiOverlayStyle(
                                            statusBarColor: tc.isDarkMode.value
                                                ? Theme.of(context)
                                                    .primaryColorDark
                                                : Theme.of(context)
                                                    .primaryColor),
                                      );
                                    }),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                              ),
                              const Spacer(),
                              ListTile(
                                onTap: () => x.signOut(),
                                title: const Text(
                                  'Sign Out',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.redAccent),
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}
