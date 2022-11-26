import 'package:android_intent_plus/android_intent.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

Widget connectTelegram() {
  return Container(
    margin: const EdgeInsets.only(top: 20),
    child: Center(
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PhysicalModel(
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
                    var url = "https://telegram.me/hilpadbot?start=123456789";
                    final telegramPKG = "org.telegram.messengers";
                    final plusPKG = "org.telegram.plus";
                    if (await DeviceApps.isAppInstalled(telegramPKG)) {
                      DeviceApps.openApp(telegramPKG).then((value) {
                        AndroidIntent(
                          action: 'action_view',
                          data: url,
                          package: telegramPKG,
                        ).launch();
                      });
                    } else if (await DeviceApps.isAppInstalled(plusPKG)) {
                      DeviceApps.openApp(plusPKG).then((value) {
                        AndroidIntent(
                          action: 'action_view',
                          data: url,
                          package: plusPKG,
                        ).launch();
                      });
                    } else {
                      AndroidIntent(
                        action: 'action_view',
                        data: url,
                      ).launch();
                    }
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
                  child: Text("Connect to HiLPaD"),
                  elevation: 14,
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 90,
                    vertical: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "You have to connect to HiLPaD to use the app",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
