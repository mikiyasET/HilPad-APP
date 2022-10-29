import 'package:get/get.dart';
import 'package:hilpad/models/batch.dart';
import 'package:hilpad/models/course.dart';
import 'package:hilpad/models/course_file.dart';
import 'package:hilpad/models/student.dart';
import 'package:hilpad/models/student_data.dart';
import 'package:hilpad/models/user.dart';

import '../constants/api_constants.dart';
import '../controller/AuthController.dart';

class BaseModel extends GetConnect{
  String controller;
  BaseModel({required this.controller});

  Future<Response> hilpadGet() => get(hilPadBaseUrl+controller,headers: {"Authorization":"bearer ${Get.find<AuthController>().token.value}"});
  Future<Response> hilpadDelete({required int id}) => get(hilPadBaseUrl+'$controller/$id',headers: {"Authorization":"bearer ${Get.find<AuthController>().token.value}"});
  Future<Response> hilpadGetById({required int id}) => get(hilPadBaseUrl+'$controller/$id',headers: {"Authorization":"bearer ${Get.find<AuthController>().token.value}"});
  Future<Response> hilpadPost({required Map data}) => post(hilPadBaseUrl+controller,data,headers: {"Authorization":"bearer ${Get.find<AuthController>().token.value}"});
  Future<Response> hilpadPatch({required Map data, required int id}) => patch(hilPadBaseUrl+'$controller/$id',data,headers: {"Authorization":"bearer ${Get.find<AuthController>().token.value}"});
  Future<Response> hilpadPut({required Map data}) => put(hilPadBaseUrl+controller,data,headers: {"Authorization":"bearer ${Get.find<AuthController>().token.value}"});

  
}

abstract class Model {
  // Not DRY, but this works.
  static T fromJson<T extends Model>(Map<String, dynamic> json) {
    switch (T) {
      case Student:
        return Student.fromJson(json) as T;
      case Batch:
        return Batch.fromJson(json) as T;
      case Course:
        return Course.fromJson(json) as T;
      case CourseFile:
        return CourseFile.fromJson(json) as T;
      case StudentData:
        return StudentData.fromJson(json) as T;
      case User:
        return User.fromJson(json) as T;
      default:
        throw UnimplementedError();
    }
  }
  Map<String, dynamic> toJson();
}
