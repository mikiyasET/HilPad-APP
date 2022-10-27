import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:hilpad/constants/api_constants.dart';
import 'package:hilpad/models/basemodel.dart';

/*class User {
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
        this.stuId});

  User.fromJson(Map<String, dynamic> json) {
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
  
}*/


/*
  Future<List> getList(BaseModel bm)async {
    Response c = await bm.hilpadGet();

    var ddd=jsonDecode(c.body);
    var pro = (ddd as List).map((data) {return Model.fromJson(data);}).toList();
    return pro;
  }

  Future getItem(int userId,BaseModel bm)async {
    Response c = await bm.hilpadGetById(id: userId);

    var ddd=jsonDecode(c.body);
    var pro =  Model.fromJson(ddd);
    return pro;
  }
*/
