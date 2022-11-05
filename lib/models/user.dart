import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hilpad/constants/api_constants.dart';
import 'package:hilpad/models/basemodel.dart';

class User extends BaseModel {
  int? id;
  String? name;
  String? username;
  String? phone;
  String? email;
  bool? status;
  String? password;
  String? idNo;
  int? stuId;

  User(
      {this.id,
      this.name,
      this.username,
      this.phone,
      this.email,
      this.status,
      this.password,
      this.idNo,
      this.stuId})
      : super(controller: user);

  User.fromJson(Map<String, dynamic> json) : super(controller: user) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    phone = json['phone'];
    email = json['email'];
    status = json['status'];
    password = json['password'];
    idNo = json['id_no'];
    stuId = json['stu_id'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['phone'] = phone;
    data['email'] = email;
    data['status'] = status;
    data['password'] = password;
    data['id_no'] = idNo;
    data['stu_id'] = stuId;
    return data;
  }


  static List<User> baseModelToType(List<BaseModel> bm){
    return bm.map((e) => e as User).toList();
  }
}

Future<List<BaseModel>> getList(BaseModel bm,{String subPath = ""}) async {
  Response c = await bm.hilpadGet(subPath: subPath);
  var ddd = jsonEncode(c.data['data']);
  print(jsonDecode(ddd));

  print(ddd);
  var pro = (jsonDecode(ddd) as List).map((data) {
    return Model.fromJson(data,bm.runtimeType);
  }).toList();
  return pro;
}

Future getItem({int? userId, required BaseModel bm,String subPath = ""}) async {
  Response c = await bm.hilpadGetById(id: userId,subPath: subPath);

  print(c.data);
  print(c.statusCode);
  print(c.headers);
  print(c.requestOptions);

  var ddd = jsonEncode(c.data["data"]);
  var pro = Model.fromJson(jsonDecode(ddd),bm.runtimeType);
  return pro;
}
