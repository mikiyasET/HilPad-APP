import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:hilpad/models/batch.dart';
import 'package:hilpad/models/course.dart';
import 'package:hilpad/models/course_file.dart';
import 'package:hilpad/models/schedule.dart';
import 'package:hilpad/models/student.dart';
import 'package:hilpad/models/student_data.dart';
import 'package:hilpad/models/token.dart';
import 'package:hilpad/models/user.dart';

import '../constants/api_constants.dart';
import '../controller/AuthController.dart';

class BaseModel {
  String controller;
  final DioCacheManager _dioCacheManager = DioCacheManager(CacheConfig());
  //final Options _cacheOptions = buildCacheOptions(const Duration(days: 20));
  final Options? _cacheOptions = null;

  static Dio dio = Dio(
      BaseOptions(
          baseUrl: hilPadBaseUrl,
          headers: {"Authorization":"bearer ${Get.find<AuthController>().token.value}"},
      )
  );

  BaseModel({required this.controller}){
    dio.interceptors.add(_dioCacheManager.interceptor);
  }

  Future<Response> hilpadGet({String subPath = ""}) => dio.get("$controller/$subPath",options: _cacheOptions);
  Future<Response> hilpadDelete({required int id}) => dio.get('$controller/$id',options: _cacheOptions);
  Future<Response> hilpadGetById({int? id,String subPath = ""}) => dio.get('$controller/$subPath/${id ?? ""}',options: _cacheOptions);
  Future<Response> hilpadPost({required Map data}) => dio.post(controller,data: data,options: _cacheOptions);
  Future<Response> hilpadPatch({required Map data, required int id}) => dio.patch('$controller/$id',data: data,options: _cacheOptions);
  Future<Response> hilpadPut({required Map data}) => dio.put(controller,data: data,options: _cacheOptions);

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
      case ScheduleModel:
        return ScheduleModel.fromJson(json);
      default:
        throw UnimplementedError();
    }
  }
  Map<String, dynamic> toJson();
}
