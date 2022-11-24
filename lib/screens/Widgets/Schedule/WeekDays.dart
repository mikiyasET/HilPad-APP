import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilpad/controller/Controller.dart';
import 'package:hilpad/services/ThemeService.dart';
import 'package:intl/intl.dart';

Widget WeekDays(selectedDay) {
  DateTime now = DateTime.now();
  late DateTime lastDayOfMonth;
  late DateTime currentDay;
  currentDay = DateTime(now.year, now.month, 0);
  lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
  // format month to name
  var month = DateFormat.MMMM().format(now);
  final daykey = GlobalKey();
  var scrollDay = false;
  WidgetsBinding.instance.addPostFrameCallback((_) => afterBuild(daykey));
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: SizedBox(
      height: 80,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(month,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
            SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(lastDayOfMonth.day, (index) {
                  final currentDate = currentDay.add(Duration(days: index + 1));
                  final dateName = DateFormat('EEEE').format(currentDate);
                  final today = DateFormat('d').format(now);
                  if ((index + 1) == int.parse(today)) {
                    selectedDay.value = index + 1;
                    return RowDay("${index + 1}", dateName, selectedDay);
                  } else if (index + 4 == int.parse(today)) {
                    return Container(
                      key: daykey,
                      child: RowDay("${index + 1}", dateName, selectedDay),
                    );
                  } else {
                    return RowDay("${index + 1}", dateName, selectedDay);
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

afterBuild(daykey) async {
  final context = daykey.currentContext;
  await Scrollable.ensureVisible(context!,
      alignment: 0,
      duration: Duration(
        milliseconds: 500,
      ));
}

Widget RowDay(no, name, selectedDay) {
  final Controller controller = Get.put(Controller());
  final ThemeController tc = Get.put(ThemeController());

  return Obx(() {
    var check = int.parse(selectedDay.value.toString()) == int.parse(no);
    return InkWell(
      onTap: () {
        controller.changeDay(name);
        selectedDay.value = int.parse(no);
      },
      child: Container(
        height: 50,
        // color: Colors.red,
        padding: const EdgeInsets.only(right: 36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              no,
              style: TextStyle(
                fontSize: check ? 20 : 18,
                fontWeight: FontWeight.bold,
                color: check
                    ? Colors.white
                    : tc.isDarkMode.value
                        ? Colors.grey
                        : Colors.white,
              ),
            ),
            check
                ? Text(
                    name.toString().substring(0, 3).toUpperCase(),
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                : Text("")
          ],
        ),
      ),
    );
  });
}
