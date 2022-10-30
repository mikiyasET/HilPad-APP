import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hilpad/controller/AuthController.dart';
import 'package:hilpad/models/token.dart';
import 'package:hilpad/models/user.dart';
import 'package:hilpad/screens/Home.dart';
import 'package:hilpad/screens/HomePage.dart';
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
                          hintText: "Email",
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
                          onPressed: () async{

                            SignIn s = SignIn();
                            Response res = await s.hilpadPost(data: {
                              "id":emailController.text,
                              "password":passwordController.text
                            });

                            if(res.status.code == 200 && res.body["status"].toString() == "true"){
                              Get.find<AuthController>().token.value = res.body["data"];
                              GetStorage().write("token", res.body["data"]);
                              customSnackBar(context, "Logged In", false);
                            }else{
                              customSnackBar(context, res.body["error"], true);
                            }
                            //print(await getList(u));
                            //print(await getItem(bm: SignIn()));

                            //controller.logIn(emailController.text, passwordController.text);
                          },
                          child: const Text('Login',
                              style: TextStyle(color: Colors.white)),
                          color: Color(0xff28D8A1),
                          padding: EdgeInsets.symmetric(vertical: 15),
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
                          padding: EdgeInsets.symmetric(vertical: 10),
                          onPressed: (){},
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
