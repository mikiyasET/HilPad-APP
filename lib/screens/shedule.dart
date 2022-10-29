import 'package:flutter/material.dart';

import '../components/course_tile.dart';

class Schedule extends StatelessWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: const [
          ScheduleCourseTile(time: "9:00 - 11:45", detail: "Maths for Natural Science", title: "CC124",color: Colors.green,isBreak: true),
          ScheduleCourseTile(time: "9:00 - 11:45", detail: "CC124 Maths for Natural Science", title: "LR601",color: Colors.green,),
          ScheduleCourseTile(time: "9:00 - 11:45", detail: "CC124 Maths for Natural Science", title: "LR302",color: Colors.purple,),
          ScheduleCourseTile(time: "9:00 - 11:45", detail: "Maths for Natural Science", title: "CC124",color: Colors.green,isBreak: true),
          ScheduleCourseTile(time: "9:00 - 11:45", detail: "CC124 Maths for Natural Science", title: "LR601",color: Colors.green,),
        ],
      ),
    );
  }
}
