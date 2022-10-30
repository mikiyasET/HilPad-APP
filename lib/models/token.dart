import 'package:hilpad/constants/api_constants.dart';

import 'basemodel.dart';

class SignUp extends BaseModel{
  String? token;
  SignUp() : super(controller: signup);
  SignUp.fromJson(Map<String, dynamic> json) : super(controller: signup) {
    token = json.toString();
  }
}

class SignIn extends BaseModel{
  String? token;
  SignIn() : super(controller: login);
  SignIn.fromJson(Map<String, dynamic> json) : super(controller: login) {
    token = json.toString();
  }
}