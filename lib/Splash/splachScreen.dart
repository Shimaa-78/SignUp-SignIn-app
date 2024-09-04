import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hawkeye/FrontPage.dart';
import 'package:hawkeye/Helpers/hive_Helper.dart';
import 'package:hawkeye/Login/loginScreen.dart';
import 'package:hawkeye/ONboarding/onboardingScreen.dart';

import '../Login/Auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Color bgclr = Color(0xff4A99FD);
  Color imgclr = Colors.white;
  int num = 1;

  void changeTheme() {
    setState(() {
      if (num == 1) {
        bgclr = Colors.white;
        imgclr = Color(0xff4A99FD);
        num = 2;
      } else {
        bgclr = Color(0xff4A99FD);
        imgclr = Colors.white;
        num = 1;
      }
    });
  }

  @override
  void initState() {
    super.initState();

    const Sec = Duration(seconds: 2);
    var time = Timer.periodic(Sec, (Timer t) => changeTheme());

    Future.delayed(Duration(seconds: 9)).then((val) {
      time.cancel();
      if (!(HiveHelper.CheckFirstVisit())) {
        print((HiveHelper.CheckFirstVisit()));
        String? token = HiveHelper.getToken();

        // Check if the token is null or empty
        if (token != null && token.isNotEmpty) {
          Get.offAll(FrontPage());
        } else {
          Get.offAll(AuthScreen());
        }
      } else {
        Get.offAll(OnBoardinScreen());
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgclr,
      body: Center(
        child: Image(
          image: AssetImage("assets/images/owl 1.png"),
          color: imgclr,
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
