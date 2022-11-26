import 'package:get/get.dart';
import 'package:hilpad/constants/Timing.dart';
import 'package:hilpad/models/batch.dart';
import 'package:hilpad/models/student.dart';
import 'package:hilpad/models/user.dart';
import 'package:hilpad/utils/universal_helper_functions.dart';
import 'package:intl/intl.dart';

import '../models/course.dart';
import '../models/schedule.dart';

Future<dynamic>? ScheduleHelper() async {
  try {
    var date = DateTime.now().obs;
    User user = await getItem(bm: User(), subPath: "token");
    Student student = await getItem(bm: Student(), id: user.stuId);
    Batch batch = await getItem(bm: Batch(), id: student.batch);
    var schedule = await getItemList(
        bm: ScheduleModel(),
        subPath: "batch/${batch.code}/${student.section ?? "A"}");
    List<Course> courses = [];
    var today = DateFormat('EEEE').format(date.value);
    var filteredSchedule = schedule.where((element) {
      return element.day.toString().toLowerCase() == today.toLowerCase();
    }).toList();
    for (var item in filteredSchedule) {
      Course course = await getItem(bm: Course(), id: item.courseID);
      courses.add(course);
    }

    return [filteredSchedule, courses];
    // return schedule;
  } catch (e) {
    print(e);
  }
}

Future<dynamic>? ScheduleHelperList() async {
  try {
    User user = await getItem(bm: User(), subPath: "token");
    Student student = await getItem(bm: Student(), id: user.stuId);
    Batch batch = await getItem(bm: Batch(), id: student.batch);
    var schedule = await getItemList(
        bm: ScheduleModel(),
        subPath: "batch/${batch.code}/${student.section ?? "A"}");
    List<Course> courses = [];

    for (var item in schedule) {
      Course course = await getItem(bm: Course(), id: item.courseID);
      courses.add(course);
    }

    return [schedule, courses];
    // return schedule;
  } catch (e) {
    print(e);
  }
}

String getPeriod(String? period) {
  switch (period) {
    case "first":
      return first_class_start;
    case "second":
      return second_class_start;
    case "third":
      return third_class_start;
    case "fourth":
      return fourth_class_start;
    default:
      return "00:00";
  }
}

int getPeriodIndex(String? period) {
  switch (period) {
    case "first":
      return 0;
    case "second":
      return 1;
    case "third":
      return 2;
    case "fourth":
      return 3;
    default:
      return 4;
  }
}

Object getPeriodTime(String? period) {
  switch (period) {
    case "first":
      final classStart = first_class_start_24.split(":");
      final start_hour = classStart[0];
      final start_min = classStart[1];
      final classEnd = first_class_end_24.split(":");
      final end_hour = classEnd[0];
      final end_min = classEnd[1];
      return {
        "start": [start_hour, start_min],
        "end": [end_hour, end_min]
      };
    case "second":
      final classStart = second_class_start_24.split(":");
      final start_hour = classStart[0];
      final start_min = classStart[1];
      final classEnd = second_class_end_24.split(":");
      final end_hour = classEnd[0];
      final end_min = classEnd[1];
      return {
        "start": [start_hour, start_min],
        "end": [end_hour, end_min]
      };
    case "third":
      final classStart = third_class_start_24.split(":");
      final start_hour = classStart[0];
      final start_min = classStart[1];
      final classEnd = third_class_end_24.split(":");
      final end_hour = classEnd[0];
      final end_min = classEnd[1];
      return {
        "start": [start_hour, start_min],
        "end": [end_hour, end_min]
      };
    case "fourth":
      final classStart = fourth_class_start_24.split(":");
      final start_hour = classStart[0];
      final start_min = classStart[1];
      final classEnd = fourth_class_end_24.split(":");
      final end_hour = classEnd[0];
      final end_min = classEnd[1];
      return {
        "start": [start_hour, start_min],
        "end": [end_hour, end_min]
      };
    default:
      return {
        "start": ["00", "00"],
        "end": ["00", "00"]
      };
  }
}

String getCourseName(id, list) {
  var course = list.where((element) {
    return element.id == id;
  }).toList();
  return course[0].name;
}
