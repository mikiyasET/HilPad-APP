import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilpad/controller/AuthController.dart';
import 'package:hilpad/screens/HomePage.dart';
import 'package:hilpad/screens/login.dart';

class Home extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
        () => (Get.find<AuthController>().user != null) ? HomePage() : Login());
  }
}
