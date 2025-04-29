import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:hilpad/controller/Controller.dart';
import 'package:hilpad/helper/CourseFilesHelper.dart';
import 'package:hilpad/models/course.dart';
import 'package:hilpad/models/course_file.dart';
import 'package:hilpad/services/ThemeService.dart';
import 'package:hilpad/utils/universal_helper_functions.dart';

import '../components/file_tile.dart';

class CourseFilesPage extends StatelessWidget {
  CourseFilesPage({Key? key}) : super(key: key);
  final c = Get.find<Controller>();
  ThemeController tc = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FutureBuilder(
          future: CourseFilesHelper(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return futureBuilderBase(
              context,
              snapshot,
              body: Builder(
                builder: (BuildContext context) {
                  List<Course> courses =
                      Course.baseModelToType(snapshot.data[0]);
                  List<List<CourseFile>> courseFiles = [];

                  for (var i = 0; i < courses.length; i++) {
                    courseFiles
                        .add(CourseFile.baseModelToType(snapshot.data[1][i]));
                  }

                  return DefaultTabController(
                    length: courses.length,
                    child: Column(
                      children: [
                        PhysicalModel(
                          color: tc.isDarkMode.value
                              ? Theme.of(context).colorScheme.surface
                              : Theme.of(context).primaryColor,
                          child: SafeArea(
                            child: TabBar(
                              indicatorColor: Colors.white,
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.white,
                              labelStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              tabAlignment: TabAlignment.start,
                              dividerColor: Colors.transparent,
                              isScrollable: true,
                              tabs: courses
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Tab(text: e.name),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height -
                              MediaQuery.of(context).size.height / 6,
                          child: TabBarView(
                            children: courses
                                .map((e) => ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 20,
                                    ),
                                    physics: const BouncingScrollPhysics(),
                                    itemCount:
                                        courseFiles[courses.indexOf(e)].length,
                                    itemBuilder: (context, index) {
                                      if ((courseFiles[courses.indexOf(e)]
                                                          [index]
                                                      .fileSize! *
                                                  0.000001)
                                              .floorToDouble() <=
                                          20) {
                                        return FileTile(
                                          file: courseFiles[courses.indexOf(e)]
                                              [index],
                                        );
                                      }
                                      ;
                                      return Container();
                                    }))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
