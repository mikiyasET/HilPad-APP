import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hilpad/components/search_bar.dart';
import 'package:hilpad/constants/api_constants.dart';
import 'package:hilpad/controller/Controller.dart';
import 'package:hilpad/models/batch.dart';
import 'package:hilpad/models/course.dart';
import 'package:hilpad/models/course_file.dart';
import 'package:hilpad/models/token.dart';
import 'package:hilpad/models/user.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../models/basemodel.dart';

class CourseFilesPage extends StatelessWidget {
  CourseFilesPage({Key? key}) : super(key: key);
  final c = Get.find<Controller>();

  var batchCourses = getList(Course(),subPath: Get.find<Controller>().currentBatch.value == ""? "" : "batch/${Get.find<Controller>().currentBatch}").obs;
  var courseFilesFuture = getList(CourseFile(),subPath: Get.find<Controller>().currentCourse.value ==""? "" : "course/${Get.find<Controller>().currentCourse}").obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchBar(),
          //Small Grid
          const SizedBox(height: 15,),

          FutureBuilder<List<BaseModel>>(
            future: getList(Batch()),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator(),);
              }
              if(snapshot.data != null){

                List<Batch> batchData = Batch.baseModelToType(snapshot.data);
                return SizedBox(
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
                          c.currentBatch.value = batchData[index].code.toString();
                          batchCourses.value = getList(Course(),subPath: "batch/${c.currentBatch}");
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
                );

              }
              else{
                return const Text("NO Data To Display");
              }
            },
          ),

          const Padding(
            padding: EdgeInsets.only(left: 25.0,top: 15,bottom: 15),
            child: Text("Courses",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400),),
          ),

          Obx(() => FutureBuilder<List<BaseModel>>(
            future: batchCourses(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator(),);
              }

              //print(snapshot.data);
              if(snapshot.data != null){
                List<Course> courseData = Course.baseModelToType(snapshot.data);

                return SizedBox(
                  height: 110,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    itemCount: courseData.length,
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: (){
                          c.currentCourse.value = courseData[index].id.toString();
                          courseFilesFuture.value = getList(CourseFile(),subPath: "course/${c.currentCourse}");
                        },
                        child: Obx(() => Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(right: 25),
                          width: 130,
                          decoration: BoxDecoration(
                              color: courseData[index].id.toString() == c.currentCourse.value? Colors.blue : Colors.blue[100],
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(courseData[index].code.toString(),style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                                Text(courseData[index].name.toString(),textAlign: TextAlign.center),
                              ]),
                        )),
                      );
                    },),
                );

              }else{
                return const Text("NO Data To Display");
              }
            },
          )),

          const Padding(
            padding: EdgeInsets.only(left: 25.0,top: 15,bottom: 15),
            child: Text("Files",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400),),
          ),

          Obx(() => FutureBuilder<List<BaseModel>>(
            future: courseFilesFuture.value,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator(),);
              }
              if(snapshot.data != null){
                List<CourseFile> courseFile = CourseFile.baseModelToType(snapshot.data);

                return Padding(
                  padding: const EdgeInsets.only(left: 25.0,right: 25),
                  child: Column(
                    children: courseFile.map((file) => FileTile(file: file)).toList(),
                  ),
                );
              }else{
                return const Text("NO Data To Display");
              }
            },
          )),
        ],
      ),
    );
  }
}


class FileTile extends StatelessWidget {
  final CourseFile file;
  FileTile({Key? key,required this.file}) : super(key: key){
    fe();
  }

  fe() async{
    isDownloaded.value = await fileExists(file.fileName)!= null;
  }

  var downloading = false.obs;
  var progress = 0.0.obs;
  var isDownloaded = false.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () async {
            //file Exists
            String? path = await fileExists(file.fileName);
            if(await fileExists(file.fileName) != null){
              OpenFile.open(path);
              //isDownloaded.value = true;
            }
            else{
              var d = DownLoad(subUrl: "api");
              Response p = await d.hilpadGet(subPath: "link/course/${file.id}");
              String downloadKey = p.data["data"];
              print(downloadKey);
              Dio().download(
                hilPadBaseUrl+"download/$downloadKey",
                await getFilePath(downloadKey),
                onReceiveProgress: (rcv, total) {
                  print(progress.value);
                  downloading.value = true;
                  progress.value = (rcv / total);
                  if (progress.value == 1) {
                    isDownloaded.value = true;
                  } else if (progress.value < 1) {

                  }
                },
                deleteOnError: true,
              ).then((_) {
                if (progress.value == 1) {
                  isDownloaded.value = true;
                }
                downloading.value = false;
              });
            }
          },
          child: Container(
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
            height: 120,
            child: Row(
              children: [
                Expanded(flex: 2,child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10)
                    ),child: Container(
                  child: Center(child: Text("${file.fileType}",style: const TextStyle(color: Color(0xff192252),fontWeight: FontWeight.w500,fontSize: 13),)),
                  height: 120,color: const Color(0xffff7466),))),
                Expanded(flex: 5,child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text("${(file.fileSize!*0.000001).floorToDouble()}MB",style: const TextStyle(color: Color(0xff8d97b2),fontWeight: FontWeight.w500,fontSize: 13),),
                      Text(file.fileName.toString(),maxLines: 2,overflow: TextOverflow.ellipsis,style: const TextStyle(height: 1.5,color: Color(0xff192252),fontWeight: FontWeight.w600,fontSize: 15),),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${file.year} ${file.season}",style: const TextStyle(color: Color(0xff8d97b2),fontSize: 12)),
                          Obx(() => isDownloaded.value?
                          const Icon(Icons.verified,color: Colors.green,) :
                          downloading.value ?
                          SizedBox(height: 25,width: 25,child: CircularProgressIndicator(backgroundColor: Colors.grey,valueColor: const AlwaysStoppedAnimation(Colors.green),strokeWidth: 3,value: progress.value,)) :
                          const Text("Download",style: TextStyle(color: Colors.blue,fontSize: 12))),
                        ],
                      ),
                    ],),
                ))
              ],
            ),
          ),
        ),
        const SizedBox(height: 12,)
      ],
    );
  }



  Future<String> getFilePath(String uniqueFileName) async {
    String path = '';
    Directory dir = await getApplicationDocumentsDirectory();
    path = '${dir.path}/${uniqueFileName.substring(37,uniqueFileName.length)}';
    return path;
  }

  Future<String?> fileExists(String? fileName) async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    String savePath = '$dir/$fileName';

    if (await File(savePath).exists()) {
      return savePath;
    } else {
      return null;
    }
  }

}
