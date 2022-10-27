import 'package:get/get.dart';
import 'package:hilpad/controller/AuthController.dart';
import 'package:hilpad/models/batch.dart';
import 'package:hilpad/models/course.dart';
import 'package:hilpad/models/course_file.dart';
import 'package:hilpad/models/student.dart';
import 'package:hilpad/models/student_data.dart';
import 'package:hilpad/models/user.dart';

/*class BaseModel extends GetConnect{
  String controller;
  BaseModel({required this.controller});

  Future<Response> hilpadGet() => get(controller);
  Future<Response> hilpadDelete({required int id}) => get('$controller/$id');
  Future<Response> hilpadGetById({required int id}) => get('$controller/$id');
  Future<Response> hilpadPost({required Map data}) => post(controller,data);
  Future<Response> hilpadPatch({required Map data, required int id}) => patch('$controller/$id',data);
  Future<Response> hilpadPut({required Map data}) => put(controller,data);

  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;
    httpClient.maxAuthRetries = 3;
    httpClient.addAuthenticator<Model?>((request) {
      request.headers['Authorization'] = "bearer ${("token should be here")}";
      return request;
    });
  }


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
}*/
