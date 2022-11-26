import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hilpad/controller/Controller.dart';
import 'package:hilpad/helper/ScheduleHelper.dart';
import 'package:hilpad/models/course.dart';
import 'package:hilpad/models/schedule.dart';
import 'package:hilpad/screens/Widgets/Schedule/Schedules.dart';
import 'package:hilpad/screens/Widgets/Schedule/noClass.dart';
import 'package:hilpad/services/ThemeService.dart';
import 'package:hilpad/utils/universal_helper_functions.dart';
import 'package:intl/intl.dart';

import 'Widgets/Schedule/WeekDays.dart';

class Schedule extends StatelessWidget {
  Schedule({Key? key}) : super(key: key);
  var day = 0.obs;
  final c = Get.find<Controller>();
  var selectedDay = 0.obs;
  final ThemeController tc = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    c.currentDay.value = DateFormat('EEEE').format(DateTime.now());
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: tc.isDarkMode.value
            ? Theme.of(context).backgroundColor
            : Theme.of(context).primaryColor));
    return Container(
      child: FutureBuilder(
          future: ScheduleHelperList(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return futureBuilderBase(
              context,
              snapshot,
              body: Builder(
                builder: (BuildContext context) {
                  var x = ScheduleModel.baseModelToType(snapshot.data[0]);
                  var courses = Course.baseModelToType(snapshot.data[1]);

                  if (x.length != 0) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Material(
                          elevation: 5,
                          child: Container(
                            color: tc.isDarkMode.value
                                ? Theme.of(context).backgroundColor
                                : Theme.of(context).primaryColor,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 10, left: 10, top: 30),
                              child: WeekDays(selectedDay),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Obx(() => x
                                      .where((element) =>
                                          element.day ==
                                          c.currentDay.value.toLowerCase())
                                      .length ==
                                  0
                              ? NoClass()
                              : Schedules(
                                  context,
                                  x.where((element) {
                                    return element.day ==
                                        c.currentDay.value.toLowerCase();
                                  }).toList(),
                                  courses,
                                  selectedDay)),
                        ),
                      ],
                    );
                  } else {
                    return NoClass(error: true);
                  }
                },
              ),
            );
          }),
    );
  }
}
