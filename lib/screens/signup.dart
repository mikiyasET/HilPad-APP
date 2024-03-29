import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/instance_manager.dart';
import 'package:hilpad/components/snackbar.dart';
import 'package:hilpad/controller/AuthController.dart';
import 'package:hilpad/models/token.dart';
import 'package:hilpad/services/ThemeService.dart';

class Signup extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ThemeController tc = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GetBuilder<ThemeController>(
                    builder: (controllerss) => IconButton(
                      icon: Icon(
                        controllerss.isDarkMode.value
                            ? Icons.wb_sunny
                            : Icons.dark_mode,
                      ),
                      onPressed: () => controllerss.toggleDarkMode(),
                    ),
                  )
                ],
              ),
            ),
            Obx(
              () => Container(
                padding: EdgeInsets.symmetric(horizontal: 35.0, vertical: 0.0),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Image.asset(
                          'assets/images/logo.png',
                          height: 200,
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                          prefixIcon: Icon(Icons.email_outlined),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Email',
                          fillColor:
                              tc.isDarkMode.value ? Color(0xff212121) : null,
                          filled: true,
                          hintStyle: tc.isDarkMode.value
                              ? TextStyle(color: Colors.white)
                              : null,
                        ),
                        style: tc.isDarkMode.value
                            ? TextStyle(color: Colors.white)
                            : null,
                        controller: emailController,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                          prefixIcon: Icon(Icons.lock_outline),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Password',
                          fillColor:
                              tc.isDarkMode.value ? Color(0xff212121) : null,
                          filled: true,
                          hintStyle: tc.isDarkMode.value
                              ? TextStyle(color: Colors.white)
                              : null,
                        ),
                        style: tc.isDarkMode.value
                            ? TextStyle(color: Colors.white)
                            : null,
                        controller: passwordController,
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () async {
                            SignUp s = SignUp();
                            Response res = await s.hilpadPost(data: {
                              "id": emailController.text,
                              "password": passwordController.text
                            });

                            if (res.statusCode == 200 &&
                                res.data["status"].toString() == "true") {
                              Get.back();
                              customSnackBar(
                                  context, "Successfully Signed Up", false);
                            } else {
                              customSnackBar(context, res.data["error"], true);
                            }
                          },
                          child: Text('Sign Up',
                              style: TextStyle(color: Colors.white)),
                          color: Color(0xff28D8A1),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          elevation: 8,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.back(),
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Color(0xff28D8A1)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
