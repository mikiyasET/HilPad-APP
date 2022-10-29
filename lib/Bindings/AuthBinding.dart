import 'package:get/get.dart';
import 'package:hilpad/controller/AuthController.dart';
import 'package:hilpad/models/basemodel.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
