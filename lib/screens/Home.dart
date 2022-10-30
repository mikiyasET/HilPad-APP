import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilpad/controller/AuthController.dart';
import 'package:hilpad/screens/HomePage.dart';
import 'package:hilpad/screens/login.dart';

class Home extends GetWidget<AuthController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => (Get.find<AuthController>().token.value != "" && Get.find<AuthController>().token.value.toLowerCase() != "null") ? HomePage() : Login());
  }
}
