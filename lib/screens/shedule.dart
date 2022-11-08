import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilpad/controller/Controller.dart';
import 'package:hilpad/models/basemodel.dart';
import 'package:hilpad/models/batch.dart';
import 'package:hilpad/models/course.dart';
import 'package:hilpad/models/schedule.dart';
import 'package:hilpad/utils/universal_helper_functions.dart';
import 'package:intl/intl.dart';

import '../components/course_tile.dart';
import '../models/user.dart';

class Schedule extends StatelessWidget {
  Schedule({Key? key}) : super(key: key);
  var day = 0.obs;
  var date = DateTime.now().obs;
  final c = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: FutureBuilder<List<List<BaseModel>>>(
        future: Future.wait([getList(ScheduleModel()),getList(Batch()),getList(Course())]),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return futureBuilderBase(context, snapshot, body: Builder(builder: (BuildContext context){
            if(snapshot.data[0] != null && snapshot.data[1] != null && snapshot.data[2] != null) {

              List<ScheduleModel> scheduleData = ScheduleModel.baseModelToType(snapshot.data[0]);
              List<Batch> batchData = Batch.baseModelToType(snapshot.data[1]);
              c.currentBatch.value = batchData[0].code!;
              c.currentBatchID.value = batchData[0].id!;
              List<Course> courseData = Course.baseModelToType(snapshot.data[2]);

              return Column(
                children: [
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left: 25,right: 25),
                      itemCount: batchData.length,
                      primary: false,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            c.currentBatchID.value = batchData[index].id!;
                            c.currentBatch.value = batchData[index].code.toString();
                          },
                          child: Obx(() => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                            margin: const EdgeInsets.only(right: 10),
                            child: Text("${batchData[index].code}",
                              style: TextStyle(
                                  color: batchData[index].code.toString() == c.currentBatch.value ? Colors.white : const Color(0xff848fac),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400
                              ),),
                            decoration: BoxDecoration(
                                color: batchData[index].code.toString() == c.currentBatch.value ? const Color(0xff082c81) : Colors.white,
                                borderRadius: BorderRadius.circular(5)
                            ),
                          )),
                        );
                      },),
                  ),
                  const SizedBox(height: 5,),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left: 25,right: 25),
                      itemCount: 7,
                      primary: false,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: (){
                            day.value = index;
                          },
                          child: Obx(() => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                            margin: const EdgeInsets.only(right: 10),
                            child: Text(DateFormat('EEEE').format(DateTime.now().add(Duration(days: index))),
                              style: TextStyle(
                                  color: day.value == index ? Colors.white : const Color(0xff848fac),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400
                              ),),
                            decoration: BoxDecoration(
                                color: day.value == index  ? const Color(0xff082c81) : Colors.white,
                                borderRadius: BorderRadius.circular(5)
                            ),
                          )),
                        );
                      },),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 25.0,top: 25,bottom: 25),
                    child: Text("Today's Class Schedule",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w600),),
                  ),
                  Obx(() => Column(
                    children: [
                      ...scheduleData.map((e){
                        if(e.day == DateFormat('EEEE').format(DateTime.now().add(Duration(days: day.value))).toLowerCase()){
                          print("${e.batchID} ${c.currentBatchID.value}");
                          if(e.batchID == c.currentBatchID.value){
                            var cor = courseData.firstWhere((element) => element.id == e.courseID);

                            return Column(
                              children: [
                                ScheduleCourseTile(time: "9:00 - ${e.period}", detail: "${cor.code} ${cor.name}", title: e.room.toString(),color: Colors.black,),
                                ScheduleCourseTile(time: "9:00 - ${e.period}", detail: "${cor.code} ${cor.name}", title: e.room.toString(),color: Colors.black,isBreak: true),
                              ],
                            );
                            /*if(e.period == DateTime.now()){
                        }else{
                          return SizedBox();
                        }*/
                          }else{
                            return SizedBox();
                          }
                        }else{
                          return const SizedBox();
                        }

                      }),
                    ],
                  ))
                ],
              );
            }
            else{
              return const Text("NO Data To Display");
            }
          }));
        },
      ),
    );
  }
}
