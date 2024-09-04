import 'package:flutter/material.dart';
import 'package:hawkeye/FrontPage.dart';
import 'package:hawkeye/Helpers/hive_Helper.dart';
import 'package:hawkeye/Login/loginScreen.dart';
import 'onboardingModel.dart';

class OnBoardinScreen extends StatefulWidget {
  const OnBoardinScreen({super.key});

  @override
  State<OnBoardinScreen> createState() => _OnBoardinScreenState();
}

class _OnBoardinScreenState extends State<OnBoardinScreen> {
  int _index = 0;

  void _onNextPressed() {
    if (_index < Items.length - 1) {
      setState(() {
        _index++;
      });
    } else {
      _navigateToLogin();
    }
  }

  @override
  void initState() {
    HiveHelper.SetOnboardingVal();
    super.initState();
  }

  void _navigateToLogin() {
    // Get.offAll(FrontPage());
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildImage(),
            _buildTitleAndDescription(),
            _buildNextButton(),
            _buildSponsorText(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: Image.asset(
        Items[_index].imgpath,
      ),
    );
  }

  Widget _buildTitleAndDescription() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            Items[_index].title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 22,
              fontFamily: "Poppins",
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          Items[_index].text,
          style: const TextStyle(
            color: Color(0xffB4B4B4),
            fontWeight: FontWeight.w300,
            fontSize: 15,
            fontFamily: "Poppins",
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildNextButton() {
    return ElevatedButton(
      onPressed: _onNextPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(15),
        backgroundColor: const Color(0xff0373F3),
      ),
      child: const Icon(
        Icons.arrow_right_alt_sharp,
        color: Colors.white,
        size: 24,
      ),
    );
  }

  Widget _buildSponsorText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star_sharp,
          color: Colors.amber[300],
          size: 10,
        ),
        const Text(
          " Nordic Vacation Sponsor",
          style: TextStyle(
            color: Color(0xff595959),
            fontFamily: "Poppins",
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
