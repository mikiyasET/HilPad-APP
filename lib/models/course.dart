import 'dart:convert';

import 'package:hilpad/constants/api_constants.dart';

import 'basemodel.dart';

class Course extends BaseModel{
  int? id;
  String? name;
  String? code;
  int? creditHour;

  Course({this.id, this.name, this.code, this.creditHour}) : super(controller: course);

  Course.fromJson(Map<String, dynamic> json) : super(controller: course) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    creditHour = json['credit_hour'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['credit_hour'] = creditHour;
    return data;
  }

  static List<Course> baseModelToType(List<BaseModel> bm){
    return bm.map((e) => e as Course).toList();
  }

}
