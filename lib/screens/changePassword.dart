import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hilpad/screens/Widgets/Settings/PasswordField.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _showPassword1 = false.obs;
    var _showPassword2 = false.obs;
    var _showPassword3 = false.obs;
    TextEditingController _currentPassword = TextEditingController();
    TextEditingController _newPassword = TextEditingController();
    TextEditingController _confirmPassword = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Obx(
          () => Column(
            children: [
              PasswordField(
                controller: _currentPassword,
                label: 'Current Password',
                showPassword: _showPassword1,
                context: context,
              ),
              SizedBox(height: 18),
              PasswordField(
                controller: _newPassword,
                label: 'New Password',
                showPassword: _showPassword2,
                context: context,
              ),
              SizedBox(height: 18),
              PasswordField(
                controller: _confirmPassword,
                label: 'Confirm Password',
                showPassword: _showPassword3,
                context: context,
              ),
              SizedBox(height: 40),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(40)),
                child: MaterialButton(
                  height: 55,
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {
                    if (_newPassword.text != _confirmPassword.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                          content: Text("Password does not match"),
                        ),
                      );
                    } else {
                      if (_newPassword.text.length < 8) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 2),
                            content: Text("Password must be 8 characters"),
                          ),
                        );
                      } else if (_newPassword.text.length > 20) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 2),
                            content: Text(
                                "Password must be less than 20 characters"),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 2),
                            content: Text(
                                "Password changed successfully | Not implemented yet"),
                          ),
                        );
                      }
                    }
                  },
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
