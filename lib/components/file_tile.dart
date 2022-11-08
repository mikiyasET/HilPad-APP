import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:open_file/open_file.dart';

import '../constants/api_constants.dart';
import '../models/course_file.dart';
import '../models/token.dart';
import '../utils/universal_helper_functions.dart';

class FileTile extends StatelessWidget {
  final CourseFile file;
  FileTile({Key? key,required this.file}) : super(key: key){
    fe();
  }

  var downloading = false.obs;
  var progress = 0.0.obs;
  var isDownloaded = false.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
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
    );
  }
  onTap()async {
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
  }

  fe() async{
    isDownloaded.value = await fileExists(file.fileName)!= null;
  }
}