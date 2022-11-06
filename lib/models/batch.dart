import 'dart:convert';

import 'package:hilpad/constants/api_constants.dart';

import 'basemodel.dart';

class Batch extends BaseModel{
  int? id;
  int? startYear;
  String? code;
  int? endYear;

  Batch({this.id, this.endYear, this.code, this.startYear}) : super(controller: batch);

  Batch.fromJson(Map<String, dynamic> json) : super(controller: batch) {
    id = json['id'];
    endYear = json['end_year'];
    code = json['code'];
    startYear = json['start_year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['end_year'] = endYear;
    data['code'] = code;
    data['start_year'] = startYear;
    return data;
  }


  static List<Batch> baseModelToType(List<BaseModel> bm){
    return bm.map((e){
      print((e as Batch).code);
      return e as Batch;
    }).toList();
  }
}
