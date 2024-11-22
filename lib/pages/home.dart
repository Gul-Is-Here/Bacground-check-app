import 'package:backgroud_check_app/auth/login.dart';
import 'package:backgroud_check_app/controller/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        actions: [
          IconButton(
              onPressed: ()  {
                 authController.logoutUser().then((val) {
                  Get.offAll(() => Login());
                });
              },
              icon: Icon(
                Icons.badge,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
