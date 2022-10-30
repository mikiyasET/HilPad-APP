import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/user.dart';

class AuthController extends GetxController {
  var token ="".obs;

  AuthController(){
    token.value = GetStorage().read("token").toString();
  }

  @override
  void onInit() {
    super.onInit();
  }

  void createUser(String email, String password) async {
    try {
      email = email.trim();
      password = password.trim();

      Get.back();
    } on Error catch (e) {
      Get.snackbar('Signup Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void logIn(String email, String password) async {
    try {
      email = email.trim();
      password = password.trim();
    } on Error catch (e) {
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  signOut(){
    token.value = "";
    GetStorage().write("token", "");
  }

}


