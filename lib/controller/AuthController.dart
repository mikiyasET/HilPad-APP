import 'package:get/get.dart';

class AuthController extends GetxController {
  var user = User().obs;
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

class User{
  String? email;
  String? password;
}
