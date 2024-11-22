import 'package:backgroud_check_app/auth/login.dart';
import 'package:backgroud_check_app/controller/authController.dart';
import 'package:backgroud_check_app/utils/globalFunctions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class Register extends StatelessWidget {
  Register({super.key});
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final _signupFormKey = GlobalKey<FormState>();

    return Scaffold(
      body: Form(
        key: _signupFormKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: authController.nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name cannot be empty'; // Added this validation for empty name
                  }
                  if (value.length < 3) {
                    return 'Name must be at least 3 characters'; // Corrected the message for short names
                  }
                  return null; // Valid name
                },
                decoration: InputDecoration(label: Text('Name')),
              ),
              TextFormField(
                controller: authController.emailController,
                validator: (value) {
                  if (value!.isNotEmpty && value.contains('@')) {
                  } else {
                    return 'field cannot be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(label: Text('Email')),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isNotEmpty && value.length > 6) {
                    // Text('')
                  } else {
                    return 'Password cannot less then 6';
                  }
                  return null;
                },
                controller: authController.passwordController,
                decoration: InputDecoration(label: Text('Password')),
              ),
              10.heightBox,
              ElevatedButton(
                  onPressed: () async {
                    if (GlobalFunctions.validateFields(_signupFormKey)) {
                      await authController.userRegister(
                          email: authController.nameController.text.trim(),
                          password:
                              authController.passwordController.text.trim(),
                          userName: authController.nameController.text.trim());
                    }
                  },
                  child: Text('Register')),
              Row(
                children: [
                  Text("Don't have an account?"),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => Login());
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          textBaseline: TextBaseline.alphabetic,
                          color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
