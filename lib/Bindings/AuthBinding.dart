import 'package:get/get.dart';
import 'package:hilpad/controller/AuthController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
