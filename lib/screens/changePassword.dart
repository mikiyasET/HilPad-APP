import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _showPassword1 = false.obs;
    var _showPassword2 = false.obs;
    var _showPassword3 = false.obs;
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Obx(
          () => Column(
            children: [
              Stack(
                children: [
                  TextFormField(
                    obscureText: _showPassword1.value ? false : true,
                    style: TextStyle(
                      fontSize: 17,
                      height: 1.3,
                      fontWeight: FontWeight.w700,
                    ),
                    cursorColor: Colors.teal,
                    scrollPadding: EdgeInsets.only(left: 40.0),
                    decoration: InputDecoration(
                      labelText: 'Old password',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        height: 0,
                      ),
                      border: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Theme.of(context).dividerColor)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Theme.of(context).dividerColor)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Theme.of(context).primaryColor)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(_showPassword1.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                          color: Theme.of(context).dividerColor,
                          onPressed: () {
                            _showPassword1.value = !_showPassword1.value;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18),
              Stack(
                children: [
                  TextFormField(
                    obscureText: _showPassword2.value ? false : true,
                    style: TextStyle(
                      fontSize: 17,
                      height: 1.3,
                      fontWeight: FontWeight.w700,
                    ),
                    cursorColor: Colors.teal,
                    scrollPadding: EdgeInsets.only(left: 40.0),
                    decoration: InputDecoration(
                      labelText: 'New password',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        height: 0,
                      ),
                      border: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Theme.of(context).dividerColor)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Theme.of(context).dividerColor)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Theme.of(context).primaryColor)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(_showPassword2.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                          color: Theme.of(context).dividerColor,
                          onPressed: () {
                            _showPassword2.value = !_showPassword2.value;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18),
              Stack(
                children: [
                  TextFormField(
                    obscureText: _showPassword3.value ? false : true,
                    style: TextStyle(
                      fontSize: 17,
                      height: 1.3,
                      fontWeight: FontWeight.w700,
                    ),
                    cursorColor: Colors.teal,
                    scrollPadding: EdgeInsets.only(left: 40.0),
                    decoration: InputDecoration(
                      labelText: 'Confirm password',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        height: 0,
                      ),
                      border: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Theme.of(context).dividerColor)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Theme.of(context).dividerColor)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: new BorderSide(
                              color: Theme.of(context).primaryColor)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(_showPassword3.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                          color: Theme.of(context).dividerColor,
                          onPressed: () {
                            _showPassword3.value = !_showPassword3.value;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40)),
                child: MaterialButton(
                  height: 55,
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {},
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
