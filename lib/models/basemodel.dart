import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:hilpad/models/batch.dart';
import 'package:hilpad/models/course.dart';
import 'package:hilpad/models/course_file.dart';
import 'package:hilpad/models/student.dart';
import 'package:hilpad/models/student_data.dart';
import 'package:hilpad/models/token.dart';
import 'package:hilpad/models/user.dart';

import '../constants/api_constants.dart';
import '../controller/AuthController.dart';

class BaseModel {
  String controller;
  static Dio dio = Dio(
      BaseOptions(
          baseUrl: hilPadBaseUrl,
          headers: {"Authorization":"bearer ${Get.find<AuthController>().token.value}"},
      )
  );
  BaseModel({required this.controller});

  Future<Response> hilpadGet({String subPath = ""}) => dio.get("$controller/$subPath");
  Future<Response> hilpadDelete({required int id}) => dio.get('$controller/$id');
  Future<Response> hilpadGetById({int? id,String subPath = ""}) => dio.get('$controller/$subPath/${id ?? ""}');
  Future<Response> hilpadPost({required Map data}) => dio.post(controller,data: data);
  Future<Response> hilpadPatch({required Map data, required int id}) => dio.patch('$controller/$id',data: data);
  Future<Response> hilpadPut({required Map data}) => dio.put(controller,data: data);

}

abstract class Model {
  // Not DRY, but this works.
  static BaseModel fromJson<T extends Model>(Map<String, dynamic> json,Type type) {
    switch (type) {
      case Student:
        return Student.fromJson(json);
      case Batch:
        return Batch.fromJson(json);
      case Course:
        return Course.fromJson(json);
      case CourseFile:
        return CourseFile.fromJson(json);
      case StudentData:
        return StudentData.fromJson(json);
      case User:
        return User.fromJson(json);
      case SignIn:
        return SignIn.fromJson(json);
      case SignUp:
        return SignUp.fromJson(json);
      default:
        throw UnimplementedError();
    }
  }
  Map<String, dynamic> toJson();
}
