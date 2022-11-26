import 'package:flutter/material.dart';

Widget PasswordField({controller, label, showPassword, context}) {
  return Stack(
    children: [
      TextFormField(
        controller: controller,
        obscureText: showPassword.value ? false : true,
        style: TextStyle(
          fontSize: 17,
          height: 1.3,
          fontWeight: FontWeight.w700,
        ),
        cursorColor: Colors.teal,
        scrollPadding: EdgeInsets.only(left: 40.0),
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            height: 0,
          ),
          border: UnderlineInputBorder(
              borderSide:
                  new BorderSide(color: Theme.of(context).dividerColor)),
          enabledBorder: UnderlineInputBorder(
              borderSide:
                  new BorderSide(color: Theme.of(context).dividerColor)),
          focusedBorder: UnderlineInputBorder(
              borderSide:
                  new BorderSide(color: Theme.of(context).primaryColor)),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(
                  showPassword.value ? Icons.visibility : Icons.visibility_off),
              color: Theme.of(context).dividerColor,
              onPressed: () {
                showPassword.value = !showPassword.value;
              },
            ),
          ],
        ),
      ),
    ],
  );
}
