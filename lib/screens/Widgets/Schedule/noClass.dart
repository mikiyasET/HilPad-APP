import 'package:flutter/material.dart';

Widget NoClass() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Opacity(
        opacity: .5,
        child: Column(
          children: const [
            Icon(
              Icons.no_backpack_rounded,
              size: 250,
              color: Colors.grey,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
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
