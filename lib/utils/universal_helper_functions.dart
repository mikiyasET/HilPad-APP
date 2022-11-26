import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilpad/controller/AuthController.dart';
import 'package:hilpad/services/ThemeService.dart';
import 'package:path_provider/path_provider.dart';

import '../models/basemodel.dart';

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

Widget futureBuilderBase(BuildContext context, AsyncSnapshot<dynamic> snapshot,
    {required Builder body}) {
  final ThemeController tc = Get.put(ThemeController());

  if (snapshot.connectionState == ConnectionState.waiting) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 100,
        child: Center(
            child: CircularProgressIndicator(
          color: tc.isDarkMode.value ? Colors.white : Colors.black,
        )));
  }
  if (snapshot.data != null) {
    return body;
  } else {
    print(snapshot);
    print(Get.find<AuthController>().token.value);
    return const Text("NO Data To Display");
  }
}

Future<List<BaseModel>> getList(BaseModel bm, {String subPath = ""}) async {
  var c = await bm.hilpadGet(subPath: subPath);
  var ddd = jsonEncode(c.data['data']);
  var pro = (jsonDecode(ddd) as List).map((data) {
    return Model.fromJson(data, bm.runtimeType);
  }).toList();
  return pro;
}

Future getItem({int? id, required BaseModel bm, String subPath = ""}) async {
  var c = await bm.hilpadGetById(id: id, subPath: subPath);
  var ddd = jsonEncode(c.data["data"]);
  var pro = Model.fromJson(jsonDecode(ddd), bm.runtimeType);
  return pro;
}

Future getItemList(
    {int? id, required BaseModel bm, String subPath = ""}) async {
  var c = await bm.hilpadGetById(id: id, subPath: subPath);
  var ddd = jsonEncode(c.data['data']);
  var pro = (jsonDecode(ddd) as List).map((data) {
    return Model.fromJson(data, bm.runtimeType);
  }).toList();
  return pro;
}
