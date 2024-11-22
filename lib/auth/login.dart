import 'package:backgroud_check_app/auth/register.dart';
import 'package:backgroud_check_app/controller/authController.dart';
import 'package:backgroud_check_app/utils/globalFunctions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final _loginFormKey = GlobalKey<FormState>();

    return Scaffold(
      body: Form(
        key: _loginFormKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                  onPressed: ()async {
                    if (GlobalFunctions.validateFields(_loginFormKey)) {
                    await  authController.userLogin(
                          email: authController.emailController.text.trim(),
                          password:
                              authController.passwordController.text.trim());
                    }
                  },
                  child: Text('Login')),
              Row(
                children: [
                  Text("Don't have an account?"),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => Register());
                    },
                    child: const Text(
                      'Sign Up',
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
