import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:open_file/open_file.dart';

import '../constants/api_constants.dart';
import '../models/course_file.dart';
import '../models/token.dart';
import '../utils/universal_helper_functions.dart';

class FileTile extends StatelessWidget {
  final CourseFile file;
  FileTile({Key? key, required this.file}) : super(key: key) {
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
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(10)),
          height: 120,
          child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      child: Container(
                        child: Center(
                          child: iconize(file.fileType),
                        ),
                        height: 120,
                      ))),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${(file.fileSize! * 0.000001).floorToDouble() > 0.0 ? (file.fileSize! * 0.000001).floorToDouble() : (file.fileSize! * 0.001).floorToDouble()}${(file.fileSize! * 0.000001).floorToDouble() > 0.0 ? "MB" : "KB"}",
                        style: TextStyle(
                            color: Theme.of(context).primaryColorLight,
                            fontWeight: FontWeight.w500,
                            fontSize: 13),
                      ),
                      Text(
                        file.fileName.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            height: 1.5,
                            color: Theme.of(context).primaryColorLight,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${file.year} ${file.season}",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorLight,
                                  fontSize: 12)),
                          Obx(
                            () => isDownloaded.value
                                ? Icon(
                                    Icons.verified,
                                    color: Theme.of(context).primaryColorLight,
                                  )
                                : downloading.value
                                    ? SizedBox(
                                        height: 25,
                                        width: 25,
                                        child: CircularProgressIndicator(
                                          backgroundColor: Colors.grey,
                                          valueColor: AlwaysStoppedAnimation(
                                              Theme.of(context)
                                                  .primaryColorLight),
                                          strokeWidth: 3,
                                          value: progress.value,
                                        ))
                                    : Text(
                                        "Download",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  onTap() async {
    //file Exists
    String? path = await fileExists(file.fileName);
    if (await fileExists(file.fileName) != null) {
      OpenFile.open(path);
      //isDownloaded.value = true;
    } else {
      try {
        downloading.value = true;
        var d = DownLoad(subUrl: "api");
        var p = await d.hilpadGet(subPath: "link/course/${file.id}");
        String downloadKey = p.data["data"];
        Dio().download(
          hilPadBaseUrl + "download/$downloadKey",
          await getFilePath(downloadKey),
          onReceiveProgress: (rcv, total) {
            print(progress.value);
            downloading.value = true;
            progress.value = (rcv / total);
            if (progress.value == 1) {
              isDownloaded.value = true;
            } else if (progress.value < 1) {}
          },
          deleteOnError: true,
        ).then((_) {
          if (progress.value == 1) {
            isDownloaded.value = true;
          }
          downloading.value = false;
        });
      } catch (e) {
        downloading.value = false;
        print(e);
        Get.rawSnackbar(message: "Unable to download file.", instantInit: true);
      }
    }
  }

  FaIcon iconize(name) {
    name = file.fileType
        .toString()
        .split(".")[file.fileType.toString().split(".").length - 1];
    name = name.split("/")[name.split("/").length - 1];
    print(name);
    switch (name) {
      case "pdf":
        return FaIcon(FontAwesomeIcons.filePdf);
      case "document":
        return FaIcon(FontAwesomeIcons.fileWord);
      case "presentation":
        return FaIcon(FontAwesomeIcons.filePowerpoint);
      case "sheet":
        return FaIcon(FontAwesomeIcons.fileExcel);
      default:
        return FaIcon(FontAwesomeIcons.file);
    }
  }

  fe() async {
    isDownloaded.value = await fileExists(file.fileName) != null;
  }
}
