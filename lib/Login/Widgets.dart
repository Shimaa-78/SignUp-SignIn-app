import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hawkeye/Login/SignUpScreen.dart';
import 'package:hawkeye/Login/loginScreen.dart'; // Import required for SystemNavigator.pop()

AppBar buildAppBar({List<Widget>? action}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Color(0xff200E32)),
      onPressed: () => SystemNavigator.pop(),
    ),
     actions:action,
  
  );
}

Widget buildLogo() {
  return Center(
    child: Column(
      children: [
        Image.asset(
          "assets/images/1.png",
          width: 70,
          height: 80,
        ),
        const SizedBox(height: 5), // Add spacing between image and text
        // Uncomment this section if you want to display the "Hawkeye" text
        // const Text(
        //   "Hawkeye",
        //   style: TextStyle(
        //     color: Color(0xff2E60F4),
        //     fontFamily: "Poppins",
        //     fontWeight: FontWeight.bold,
        //     fontSize: 32,
        //   ),
        // ),
      ],
    ),
  );
}

Widget RowIconBuild(String path) {
  return Container(
    height: 40,
    width: 80,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 240, 223, 223)
              .withOpacity(0.7), // Shadow color
          spreadRadius: 3,
          blurRadius: 5,
          offset: const Offset(0, 4), // Shadow position
        ),
      ],
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
    ),
    child: Center(
      child: Image.asset(
        path,
        width: 20,
        height: 30,
      ),
    ),
  );
}

Widget BuildButton(String label, void Function() onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 240, 232, 232)
                .withOpacity(0.5), // Shadow color
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 4), // Shadow position
          ),
        ],
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xff2E60F4),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

Widget NavigateToSignup(void Function() ontab) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Don't have an account?",
        style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w500),
      ),
      InkWell(
        onTap: ontab,
        child: Text(
          " Sign Up",
          style:
              TextStyle(color: Color(0xff2E60F4), fontWeight: FontWeight.w500),
        ),
      ),
    ],
  );
}
