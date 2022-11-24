import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hilpad/controller/AuthController.dart';
import 'package:hilpad/models/token.dart';
import 'package:hilpad/services/ThemeService.dart';

import '../components/snackbar.dart';

class Login extends GetWidget<AuthController> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ThemeController tc = Get.put(ThemeController());
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 35.0, vertical: 0.0),
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
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15),
                          prefixIcon: const Icon(Icons.grid_3x3),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "ID",
                          fillColor: tc.isDarkMode.value
                              ? const Color(0xff212121)
                              : null,
                          filled: true,
                          hintStyle: tc.isDarkMode.value
                              ? const TextStyle(color: Colors.white)
                              : null,
                        ),
                        style: tc.isDarkMode.value
                            ? const TextStyle(color: Colors.white)
                            : null,
                        controller: emailController,
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 15),
                          prefixIcon: const Icon(Icons.lock_outline),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Password',
                          fillColor: tc.isDarkMode.value
                              ? const Color(0xff212121)
                              : null,
                          filled: true,
                          hintStyle: tc.isDarkMode.value
                              ? const TextStyle(color: Colors.white)
                              : null,
                        ),
                        style: tc.isDarkMode.value
                            ? const TextStyle(color: Colors.white)
                            : null,
                        controller: passwordController,
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () async {
                            SignIn s = SignIn();
                            Response res = await s.hilpadPost(data: {
                              "id": emailController.text,
                              "password": passwordController.text
                            });

                            if (res.statusCode == 200 &&
                                res.data["status"].toString() == "true") {
                              Get.find<AuthController>().token.value =
                                  res.data["data"];
                              GetStorage().write("token", res.data["data"]);
                              customSnackBar(context, "Logged In", false);
                            } else {
                              print(res.data["error"]);
                              customSnackBar(context, res.data["error"], true);
                              //GetStorage().write("token", "dummyData");
                              //Get.find<AuthController>().token.value = "dummyData";
                            }
                            //print(await getList(u));
                            //print(await getItem(bm: SignIn()));

                            //controller.logIn(emailController.text, passwordController.text);
                          },
                          child: const Text('Login',
                              style: TextStyle(color: Colors.white)),
                          color: const Color(0xff28D8A1),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          elevation: 8,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed('/signup'),
                        child: const Text(
                          'Signup',
                          style: TextStyle(color: Color(0xff28D8A1)),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: SignInButton(
                          Buttons.Google,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          onPressed: () {},
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
