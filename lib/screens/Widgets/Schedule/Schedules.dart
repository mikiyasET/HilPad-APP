import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hilpad/helper/ScheduleHelper.dart';
import 'package:intl/intl.dart';
import 'package:timelines/timelines.dart';

Widget Schedules(context, x, courses, selectedDay) {
  // sort x by period first,second,third,fourth
  x.sort(
      (a, b) => getPeriodIndex(a.period).compareTo(getPeriodIndex(b.period)));

  // final today_name = DateFormat('EEEE').format(DateTime.now());
  // final today_hour = DateFormat('H').format(DateTime.now());
  // final today_minute = DateFormat('m').format(DateTime.now());
  final today_day = DateFormat('d').format(DateTime.now());
  final today_name = DateFormat('EEEE').format(DateTime.now()).toLowerCase();
  ;
  return DefaultTextStyle(
    style: TextStyle(
      color: Color(0xff9b9b9b),
      fontSize: 12.5,
    ),
    child: Padding(
      padding: const EdgeInsets.all(0.0),
      child: FixedTimeline.tileBuilder(
        theme: TimelineThemeData(
          color: const Color(0xff989898),
          indicatorTheme: const IndicatorThemeData(
            position: 0,
            size: 20.0,
            color: Color(0xff6AC89B),
          ),
          connectorTheme: const ConnectorThemeData(
            thickness: 2.5,
            space: 1,
            indent: 10,
            color: Color(0xff3D3E40),
          ),
        ),
        builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.before,
            itemCount: x.length,
            nodePositionBuilder: (context, index) => 0.25,
            oppositeContentsBuilder: (context, index) {
              if (int.parse(today_day) <=
                  int.parse(selectedDay.value.toString())) {
                return Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Column(
                    children: [
                      isPeriod(x[index].period) == 0 &&
                              x[index].day == today_name
                          ? Opacity(
                              opacity: .5,
                              child: Text(
                                getPeriod(x[index].period.toString()),
                                style:
                                    DefaultTextStyle.of(context).style.copyWith(
                                          fontSize: 15.0,
                                        ),
                              ))
                          : Text(
                              getPeriod(x[index].period.toString()),
                              style:
                                  DefaultTextStyle.of(context).style.copyWith(
                                        fontSize: 15.0,
                                      ),
                            ),
                    ],
                  ),
                );
              } else {
                return Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Column(
                    children: [
                      Opacity(
                          opacity: .5,
                          child: Text(
                            getPeriod(x[index].period.toString()),
                            style: DefaultTextStyle.of(context).style.copyWith(
                                  fontSize: 15.0,
                                ),
                          ))
                    ],
                  ),
                );
              }
            },
            contentsBuilder: (context, index) {
              Widget classCard() {
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(
                            getCourseName(x[index].courseID, courses)
                                .toString()
                                .substring(
                                    0,
                                    getCourseName(x[index].courseID, courses)
                                                .toString()
                                                .length >
                                            26
                                        ? 26
                                        : getCourseName(
                                                x[index].courseID, courses)
                                            .toString()
                                            .length),
                            style: DefaultTextStyle.of(context).style.copyWith(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: isPeriod(x[index].period) >= 1 &&
                                        x[index].day == today_name
                                    ? Colors.white
                                    : Color(0xff9b9b9b)),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          isPeriod(x[index].period) == 1 &&
                                  x[index].day == today_name
                              ? Material(
                                  elevation: 2,
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 2.0),
                                      child: Text(
                                        "Now",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              : Text(""),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 13,
                              color: Color(0xff9b9b9b),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              "Room ${x[index].room}",
                              style:
                                  DefaultTextStyle.of(context).style.copyWith(
                                        fontSize: 14.0,
                                      ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }

              if (int.parse(today_day) <=
                  int.parse(selectedDay.value.toString())) {
                return isPeriod(x[index].period) == 0 &&
                        x[index].day == today_name
                    ? Opacity(opacity: .5, child: classCard())
                    : classCard();
              } else {
                return Opacity(opacity: .5, child: classCard());
              }
            },
            indicatorBuilder: (_, index) {
              if (int.parse(today_day) >
                  int.parse(selectedDay.value.toString())) {
                return OutlinedDotIndicator(
                  color: Theme.of(context).primaryColor.withOpacity(.5),
                  child: Icon(
                    Icons.check,
                    color: Theme.of(context).primaryColor.withOpacity(.5),
                    size: 12.0,
                  ),
                );
              } else if (isPeriod(x[index].period) == 0 &&
                  x[index].day == today_name) {
                return OutlinedDotIndicator(
                  color: Theme.of(context).primaryColor.withOpacity(.5),
                  child: Icon(
                    Icons.check,
                    color: Theme.of(context).primaryColor.withOpacity(.5),
                    size: 12.0,
                  ),
                );
              } else if (isPeriod(x[index].period) == 1 &&
                  x[index].day == today_name) {
                return OutlinedDotIndicator(
                  color: Theme.of(context).primaryColor.withOpacity(.5),
                  child: Icon(
                    Icons.circle,
                    color: Theme.of(context).primaryColor.withOpacity(.5),
                    size: 12.0,
                  ),
                );
              } else {
                return OutlinedDotIndicator(
                  borderWidth: 2.5,
                  color: Theme.of(context).primaryColor,
                );
              }
            },
            connectorBuilder: (_, index, ___) {
              if (int.parse(today_day) >
                  int.parse(selectedDay.value.toString())) {
                return SolidLineConnector(
                  color: Theme.of(context).primaryColor.withOpacity(.5),
                );
              } else {
                return SolidLineConnector(
                  color: Theme.of(context).primaryColor,
                );
              }
            }),
      ),
    ),
  );
}

isPeriod(periodTime) {
  final today_hour = DateFormat('H').format(DateTime.now());
  final today_minute = DateFormat('m').format(DateTime.now());

  final period = jsonDecode(jsonEncode(getPeriodTime(periodTime)));
  final current = int.parse(
      DateTime(2000, 1, 1, int.parse(today_hour), int.parse(today_minute))
          .millisecondsSinceEpoch
          .toString()
          .substring(0, 10));
  final period_start = int.parse(DateTime(2000, 1, 1,
          int.parse(period['start'][0]), int.parse(period['start'][1]))
      .millisecondsSinceEpoch
      .toString()
      .substring(0, 10));
  final period_end = int.parse(DateTime(
          2000, 1, 1, int.parse(period['end'][0]), int.parse(period['end'][1]))
      .millisecondsSinceEpoch
      .toString()
      .substring(0, 10));

  if (current >= period_start && current <= period_end) {
    return 1; // period is now
  } else if (current <= period_start) {
    return 2; // period is not yet
  } else if (current >= period_end) {
    return 0; // period is over
  } else {
    return 0; // No period
  }
}

isDayPassed(today, pre) {
  final days = [
    "monday",
    "tuesday",
    "wednesday",
    "thursday",
    "friday",
    "saturday",
    "sunday"
  ];
  final today_index = days.indexOf(today.toLowerCase());
  final pre_index = days.indexOf(pre.toLowerCase());
  if (today_index > pre_index) {
    return true;
  } else {
    return false;
  }
}
