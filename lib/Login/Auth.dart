import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'SignUpScreen.dart';
import 'Widgets.dart';
import 'loginScreen.dart';
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildLogo(),
            const SizedBox(height: 70),
            BuildButton("Login",  () {

              Get.to(
                LoginScreen(),
              );
            }),

            SizedBox(
              height: 30,
            ),
            BuildButton("Create Account",  () {

              Get.to(
                SignUp(),
              );
            }),

          ],
        ),
      ),
    );

  }
}
