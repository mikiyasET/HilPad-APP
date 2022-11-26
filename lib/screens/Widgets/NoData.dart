import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget NoData(context) {
  return Padding(
    padding: EdgeInsets.only(top: (MediaQuery.of(context).size.height / 4)),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.receipt_long,
            size: 100,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "No data",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "No data please try again later",
            style: TextStyle(
                fontSize: 13, color: Colors.grey, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}
