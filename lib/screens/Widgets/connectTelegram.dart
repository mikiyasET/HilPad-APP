import 'package:android_intent_plus/android_intent.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilpad/controller/AuthController.dart';
import 'package:socket_io_client/socket_io_client.dart';


Widget connectTelegram() {
  final AuthController x = Get.find<AuthController>();
  return Container(
    margin: const EdgeInsets.only(top: 20),
    child: Center(
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const PhysicalModel(
              shape: BoxShape.circle,
              color: Colors.white,
              child: Icon(
                Icons.telegram,
                size: 200,
                color: Colors.blue,
              ),
            ),
            Column(
              children: [
                MaterialButton(
                  onPressed: () async {

                    Socket socket = io('http://localhost:4000');
                    print("hereeeeeeeeeeeeee");
                    try{
                      socket.onConnect((_) {
                        print('connect');
                        socket.emit('msg', 'test');
                      });
                      socket.on('event', (data) => print(data));
                      socket.onDisconnect((_) => print('disconnect'));
                      socket.on('fromServer', (_) => print(_));
                    } catch (e){
                      print(e);
                    }


                    var url = "https://telegram.me/hilpadbot?start=123456789";
                    const telegramPKG = "org.telegram.messengers";
                    const plusPKG = "org.telegram.plus";
                    /*if (await DeviceApps.isAppInstalled(telegramPKG)) {
                      DeviceApps.openApp(telegramPKG).then((value) {
                        AndroidIntent(
                          action: 'action_view',
                          data: url,
                          package: telegramPKG,
                        ).launch();
                      });
                    }
                    else if (await DeviceApps.isAppInstalled(plusPKG)) {
                      DeviceApps.openApp(plusPKG).then((value) {
                        AndroidIntent(
                          action: 'action_view',
                          data: url,
                          package: plusPKG,
                        ).launch();
                      });
                    }
                    else {
                      AndroidIntent(
                        action: 'action_view',
                        data: url,
                      ).launch();
                    }*/


                    // else {
                    //   DeviceApps.openApp('com.android.chrome').then((value) {
                    //     AndroidIntent(
                    //       action: 'action_view',
                    //       data: url,
                    //       package: 'com.android.chrome',
                    //     ).launch();
                    //   });
                    // }
                  },
                  child: const Text(
                    "Connect to HiLPaD",
                    style: TextStyle(color: Colors.white),
                  ),
                  elevation: 14,
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 90,
                    vertical: 20,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "You have to connect to HiLPaD to use the app",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                TextButton(
                    onPressed: () => x.signOut(), child: const Text("Sign Out"))
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
