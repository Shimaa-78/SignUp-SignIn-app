import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hawkeye/ONboarding/onboardingScreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class animatedSplashScreen extends StatefulWidget {
  const animatedSplashScreen({super.key});

  @override
  State<animatedSplashScreen> createState() => _animatedSplashScreenState();
}

class _animatedSplashScreenState extends State<animatedSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff66D2CC),
              Color(0xff4A99FD),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      child: AnimatedSplashScreen(
  splash: TweenAnimationBuilder<double>(
    tween: Tween<double>(begin: 0.5, end: 2), 
    duration: Duration(seconds: 2), // Duration of the scaling
    curve: Curves.easeInOut, // Easing curve for smooth animation
    builder: (context, scale, child) {
      return Transform.scale(
        scale: scale,
        child: Transform.rotate(
          angle: scale * 2 * 3.14159, // Rotation angle based on scale
          child: child,
        ),
      );
    },
    child: Image.asset(
      "assets/images/owl 1.png",
      width: 147,
      height: 147,
    ),
  ),
  backgroundColor: Colors.transparent,
  nextScreen: OnBoardinScreen(),
  duration: 4000,  // Adjust to match or exceed animationDuration
  splashTransition: SplashTransition.rotationTransition,
  pageTransitionType: PageTransitionType.leftToRight,
  animationDuration: Duration(seconds: 4), // Match with the splash animation duration
),

      ),
    );
  }
}
