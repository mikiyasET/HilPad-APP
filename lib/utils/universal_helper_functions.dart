import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

Future<String> getFilePath(String uniqueFileName) async {
  String path = '';
  Directory dir = await getApplicationDocumentsDirectory();
  path = '${dir.path}/${uniqueFileName.substring(37, uniqueFileName.length)}';
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

Widget futureBuilderBase(BuildContext context, AsyncSnapshot<dynamic> snapshot, {required Builder body})  {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
  if (snapshot.data != null) {
    return body;
  } else {
    return const Text("NO Data To Display");
  }
}
