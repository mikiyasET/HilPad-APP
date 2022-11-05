import 'package:flutter/material.dart';

import '../components/search_bar.dart';

class ExamFilesPage extends StatelessWidget {
  ExamFilesPage({Key? key}) : super(key: key);
  final List<Color> col = [
    Color(0xffd6effd),
    Color(0xfffcf1d5),
    Color(0xfffdd6da),
    Color(0xffd6effd),
    Color(0xfffcf1d5),
    Color(0xfffdd6da),
    Color(0xfffcf1d5),
    Color(0xffd6effd),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*FutureBuilder(
            future: getList(Course()),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator(),);
              }

              //print(snapshot.data);
              if(snapshot.data != null){
                List<Course> data = snapshot.data as List<Course>;
                return Column(
                  children: data.map((e) =>
                      ListTile(
                        leading: Icon(Icons.folder),
                        trailing: Icon(Icons.more_horiz),
                        title: Text("${e.name} ${e.code}"),
                      )).toList(),
                );
              }else{
                return const Text("NO Data To Display");
              }
            },
          ),*/
          const SearchBar(),
          const Padding(
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
                      color: col[index],
                      borderRadius: BorderRadius.circular(20)
                  ),
                );
              },),
          ),

          
          const Padding(
            padding: EdgeInsets.only(left: 25.0,top: 25,bottom: 15),
            child: Text("Courses",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w400),),
          ),
          Padding(
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
          )

        ],
      ),
    );
  }
}
