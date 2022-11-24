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

  static List<User> baseModelToType(List<BaseModel> bm) {
    return bm.map((e) => e as User).toList();
  }
}
