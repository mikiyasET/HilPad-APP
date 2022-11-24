import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hilpad/components/search_bar.dart';
import 'package:hilpad/controller/Controller.dart';
import 'package:hilpad/models/course.dart';
import 'package:hilpad/models/course_file.dart';
import 'package:hilpad/utils/universal_helper_functions.dart';

import '../components/file_tile.dart';
import '../models/basemodel.dart';

class CourseFilesPage extends StatelessWidget {
  CourseFilesPage({Key? key}) : super(key: key);
  final c = Get.find<Controller>();

  var batchCourses = getList(Course(),
          subPath: Get.find<Controller>().currentBatch.value == ""
              ? ""
              : "batch/${Get.find<Controller>().currentBatch}")
      .obs;
  var courseFilesFuture = getList(CourseFile(),
          subPath: Get.find<Controller>().currentCourse.value == ""
              ? ""
              : "course/${Get.find<Controller>().currentCourse}")
      .obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchBar(),
          //Batch Grid
          const SizedBox(
            height: 15,
          ),

          Obx(() => FutureBuilder<List<BaseModel>>(
                future: courseFilesFuture.value,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return futureBuilderBase(context, snapshot,
                      body: Builder(builder: (BuildContext context) {
                    List<CourseFile> courseFile =
                        CourseFile.baseModelToType(snapshot.data);
                    return Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25),
                      child: Column(
                        children: courseFile
                            .map((file) => FileTile(file: file))
                            .toList(),
                      ),
                    );
                  }));
                },
              )),
        ],
      ),
    );
  }
}
