import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilpad/utils/universal_helper_functions.dart';
import '../controller/AuthController.dart';
import '../models/user.dart';
import '../services/ThemeService.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);
  final AuthController x = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      child: Column(
        children: [
          AppBar(
            title: const Text('HilPad'),
            centerTitle: true,
            actions: [
              IconButton(onPressed: () => x.signOut(), icon: const Center(child: Icon(Icons.logout))),
              GetBuilder<ThemeController>(
                builder: (controller) => IconButton(
                  icon: Icon(
                    controller.isDarkMode.value ? Icons.wb_sunny : Icons.dark_mode,
                  ),
                  onPressed: () => controller.toggleDarkMode(),
                ),
              )
            ],
          ),
          const SizedBox(height: 180,),

          FutureBuilder(
            future: getItem(bm: User(),subPath: "token"),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return futureBuilderBase(context, snapshot, body: Builder(builder: (BuildContext context){
                User userData = snapshot.data as User;
                return Container(
                  padding: const EdgeInsets.only(left: 10,right: 10,top: 30,bottom: 80),
                  width: Get.size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40)
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -120,
                        left: 100,
                        child: Container(
                          width: 160,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(40)
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 60),
                          Text("${userData.name}(${userData.idNo})".toString(),style: const TextStyle(fontSize: 26,fontWeight: FontWeight.w600),),
                          const SizedBox(height: 15,),
                          Text("${userData.username}  ${userData.email}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                          Text("${userData.phone}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),

                          const SizedBox(height: 20,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 15),
                                width: 107,
                                height: 90,
                                decoration: BoxDecoration(
                                    color: Color(0xfffcf1d5),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 15),
                                width: 107,
                                height: 90,
                                decoration: BoxDecoration(
                                    color: Color(0xfffcf1d5),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(),
                                width: 107,
                                height: 90,
                                decoration: BoxDecoration(
                                    color: Color(0xfffcf1d5),
                                    borderRadius: BorderRadius.circular(20)
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 50,),
                          Text("Additional Settings",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w600),),


                          SizedBox(height: 100,)
                        ],
                      ),
                    ],
                  ),
                );
              }));
            },
          ),

        ],
      ),
    );
  }
}
