import 'package:flutter/material.dart';

Widget NoClass({error = false}) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Opacity(
        opacity: .5,
        child: Column(
          children: [
            Icon(
              Icons.no_backpack_rounded,
              size: 250,
              color: Colors.grey,
            ),
            SizedBox(
              height: 20,
            ),
            error
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Batch schedule is not available\nTry changing your batch & section",
                        textAlign: TextAlign.center,
                      ),
                      // TextButton(
                      //     onPressed: () => Get.toNamed('/changeBatch'),
                      //     child: Text("change batch"))
                    ],
                  )
                : Text(
                    "Oh it looks like there is no class",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                  )
          ],
        ),
      ));
}
