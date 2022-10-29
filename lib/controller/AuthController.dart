import 'package:get/get.dart';

import '../models/user.dart';

class AuthController extends GetxController {
  var user = User().obs;
  var token ="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNjY2NTU0ODQ0fQ.78_7JOvRKiRgZE8sJd9dOmOY3juyCWyPT4yGpT3XSak".obs;
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

  }

}


