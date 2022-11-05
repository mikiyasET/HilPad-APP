import 'package:flutter/material.dart';
import 'package:hilpad/components/search_bar.dart';
import 'package:hilpad/models/course.dart';
import 'package:hilpad/models/course_file.dart';
import 'package:hilpad/models/user.dart';

import '../models/basemodel.dart';

class CourseFilesPage extends StatelessWidget {
  const CourseFilesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchBar(),
          /*const Padding(
            padding: EdgeInsets.only(left: 25.0,top: 25,bottom: 15),
            child: Text("Batches",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400),),
          ),
          //Big Box
          SizedBox(
            height: 110,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 25,right: 25),
              itemCount: 8,
              primary: false,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(right: 25),
                  width: 130,
                  decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(20)
                  ),
                );
              },),
          ),*/

          //Small Grid
          const SizedBox(height: 15,),

          SizedBox(
            height: 40,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 25,right: 25),
              itemCount: 8,
              primary: false,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  margin: const EdgeInsets.only(right: 10),
                  child: Text("batch $index",
                    style: TextStyle(
                        color: index == 0 ? Colors.white : Color(0xff848fac),
                        fontSize: 16,
                        fontWeight: FontWeight.w400
                    ),),
                  //width: 50,
                  decoration: BoxDecoration(
                      color: index == 0 ? Color(0xff082c81) : Colors.white,
                      borderRadius: BorderRadius.circular(5)
                  ),
                );
              },),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 25.0,top: 15,bottom: 15),
            child: Text("Courses",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400),),
          ),

          FutureBuilder<List<BaseModel>>(
            future: getList(Course()),
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
                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(right: 25),
                        width: 130,
                        decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(courseData[index].code.toString(),style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                              Text(courseData[index].name.toString(),textAlign: TextAlign.center),
                            ]),
                      );
                    },),
                );

              }else{
                return const Text("NO Data To Display");
              }
            },
          ),

          const Padding(
            padding: EdgeInsets.only(left: 25.0,top: 15,bottom: 15),
            child: Text("Files",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400),),
          ),

          FutureBuilder<List<BaseModel>>(
            future: getList(CourseFile()),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator(),);
              }
              if(snapshot.data != null){
                List<CourseFile> courseFile = CourseFile.baseModelToType(snapshot.data);

                return Padding(
                  padding: const EdgeInsets.only(left: 25.0,right: 25),
                  child: Column(
                    children: courseFile.map((file) => Column(
                      children: [
                        Container(
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
                                    Text("${file.year} ${file.season}",style: const TextStyle(color: Color(0xff8d97b2),fontSize: 12)),
                                  ],),
                              ))
                            ],
                          ),
                        ),
                        const SizedBox(height: 12,)
                      ],
                    )).toList(),
                  ),
                );

              }else{
                return const Text("NO Data To Display");
              }
            },
          ),

          /*Padding(
            padding: const EdgeInsets.only(left: 25.0,right: 25),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                  height: 120,
                  child: Row(
                    children: [
                      Expanded(flex: 2,child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10)
                          ),child: Container(height: 120,color: const Color(0xffff7466),))),
                      Expanded(flex: 5,child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Picolab Studio",style: TextStyle(color: Color(0xff8d97b2),fontWeight: FontWeight.w500,fontSize: 13),),
                            Text("Keep your business in balance today",style: TextStyle(height: 1.5,color: Color(0xff192252),fontWeight: FontWeight.w600,fontSize: 15),),
                            Spacer(),
                            Text("1 hour ago",style: TextStyle(color: Color(0xff8d97b2),fontSize: 12)),
                        ],),
                      ))
                    ],
                  ),
                ),
                SizedBox(height: 12,),
                Container(
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                  height: 120,
                  child: Row(
                    children: [
                      Expanded(flex: 2,child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10)
                          ),child: Container(height: 120,color: Color(0xfff16b7f),))),
                      Expanded(flex: 5,child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Picolab Studio",style: TextStyle(color: Color(0xff8d97b2),fontWeight: FontWeight.w500,fontSize: 13),),
                            Text("Keep your business in balance today",style: TextStyle(height: 1.5,color: Color(0xff192252),fontWeight: FontWeight.w600,fontSize: 15),),
                            Spacer(),
                            Text("1 hour ago",style: TextStyle(color: Color(0xff8d97b2),fontSize: 12)),
                          ],),
                      ))                    ],
                  ),
                ),
                SizedBox(height: 12,),
                Container(
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                  height: 120,
                  child: Row(
                    children: [
                      Expanded(flex: 2,child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10)
                          ),child: Container(height: 120,color: Color(0xfff9bfbf),))),
                      Expanded(flex: 5,child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Picolab Studio",style: TextStyle(color: Color(0xff8d97b2),fontWeight: FontWeight.w500,fontSize: 13),),
                            Text("Keep your business in balance today",style: TextStyle(height: 1.5,color: Color(0xff192252),fontWeight: FontWeight.w600,fontSize: 15),),
                            Spacer(),
                            Text("1 hour ago",style: TextStyle(color: Color(0xff8d97b2),fontSize: 12)),
                          ],),
                      ))                    ],
                  ),
                ),
                SizedBox(height: 12,),
                Container(
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                  height: 120,
                  child: Row(
                    children: [
                      Expanded(flex: 2,child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10)
                          ),child: Container(height: 120,color: const Color(0xffff7466),))),
                      Expanded(flex: 5,child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Picolab Studio",style: TextStyle(color: Color(0xff8d97b2),fontWeight: FontWeight.w500,fontSize: 13),),
                            Text("Keep your business in balance today",style: TextStyle(height: 1.5,color: Color(0xff192252),fontWeight: FontWeight.w600,fontSize: 15),),
                            Spacer(),
                            Text("1 hour ago",style: TextStyle(color: Color(0xff8d97b2),fontSize: 12)),
                        ],),
                      ))
                    ],
                  ),
                ),
                SizedBox(height: 12,),
                Container(
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                  height: 120,
                  child: Row(
                    children: [
                      Expanded(flex: 2,child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10)
                          ),child: Container(height: 120,color: Color(0xfff16b7f),))),
                      Expanded(flex: 5,child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Picolab Studio",style: TextStyle(color: Color(0xff8d97b2),fontWeight: FontWeight.w500,fontSize: 13),),
                            Text("Keep your business in balance today",style: TextStyle(height: 1.5,color: Color(0xff192252),fontWeight: FontWeight.w600,fontSize: 15),),
                            Spacer(),
                            Text("1 hour ago",style: TextStyle(color: Color(0xff8d97b2),fontSize: 12)),
                          ],),
                      ))                    ],
                  ),
                ),
                SizedBox(height: 12,),
                Container(
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                  height: 120,
                  child: Row(
                    children: [
                      Expanded(flex: 2,child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10)
                          ),child: Container(height: 120,color: Color(0xfff9bfbf),))),
                      Expanded(flex: 5,child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("Picolab Studio",style: TextStyle(color: Color(0xff8d97b2),fontWeight: FontWeight.w500,fontSize: 13),),
                            Text("Keep your business in balance today",style: TextStyle(height: 1.5,color: Color(0xff192252),fontWeight: FontWeight.w600,fontSize: 15),),
                            Spacer(),
                            Text("1 hour ago",style: TextStyle(color: Color(0xff8d97b2),fontSize: 12)),
                          ],),
                      ))                    ],
                  ),
                ),
                SizedBox(height: 12,),
              ],
            ),
          )*/

        ],
      ),
    );
  }
}
