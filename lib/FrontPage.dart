import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hawkeye/FontPageRatingModel.dart';
import 'package:hawkeye/Helpers/hive_Helper.dart';
import 'package:hawkeye/Login/Auth.dart';
import 'package:hawkeye/Login/Widgets.dart';
import 'package:hawkeye/Login/loginScreen.dart';
import 'package:hawkeye/Splash/animatedSplachScreen.dart';


class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  final List<Model_1> model1List = [
    Model_1(
        imagePathg: "assets/images/location1 (1).png",
        title: "Switzerland",
        rate: 4.9,
        price: 699),
    Model_1(
        imagePathg: "assets/images/location1 (2).png",
        title: "Ilulissat Icefjord",
        rate: 3.5,
        price: 726),
  ];

  final List<Model_2> model2List = [
    Model_2(
        imagePathg: "assets/images/location3.png",
        title: "Western Strait",
        location: 6),
    Model_2(
        imagePathg: "assets/images/location4.png",
        title: "Beach House",
        location: 22),
    Model_2(
        imagePathg: "assets/images/location3.png",
        title: "Western Strait",
        location: 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: buildAppBar(action:[ IconButton(
       icon: const Icon(Icons.logout, color: Color(0xff200E32)),
       onPressed: (){

         setState(() {
           HiveHelper.setToken("");
         });
         Get.offAll(AuthScreen());},
     ),]),
      
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffFFFFFF),
              Color(0xffFAFAFA),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderText(),
                  const SizedBox(height: 20),
                  _buildSearchRow(),
                  const SizedBox(height: 20),
                  _buildSectionTitle("Popular locations"),
                  const SizedBox(height: 20),
                  _buildHorizontalList(),
                  _buildSectionTitle("Popular locations"),
                  const SizedBox(height: 20),
                  _buildHorizontalList2(),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomAppBar(),
    );
  }

  Widget _buildHeaderText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Find your next trip",
          style: TextStyle(
            color: Color(0xff818181),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: "Poppins",
          ),
        ),
        SizedBox(height: 10), // Add some spacing
        Text(
          "Nordic scenery",
          style: TextStyle(
            color: Color(0xff000000),
            fontSize: 26,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
          ),
        ),
      ],
    );
  }

  Widget _buildSearchRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xffE9E9E9)),
            ),
            child: Row(
              children: const [
                Icon(
                  Icons.search,
                  color: Color(0xffAAAAAA),
                ),
                SizedBox(width: 10),
                Text(
                  "Search",
                  style: TextStyle(
                    color: Color(0xffA9A9A9),
                    fontSize: 16,
                    fontFamily: "Poppins",
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          // onTap: () {
          //   Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => animatedSplashScreen(),
          //   ));
          // },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xff0373F3),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(
              Icons.toc_rounded,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: Color(0xff000000),
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: "Poppins",
      ),
    );
  }

  Widget _buildHorizontalList() {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: model1List.length,
        itemBuilder: (context, index) {
          final model = model1List[index];
          return _buildImageCard(
            model.imagePathg,
            model.title,
            model.price,
            model.rate,
          );
        },
      ),
    );
  }

  Widget _buildImageCard(
      String imagePath, String text, double price, double rate) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20), // Border radius
        child: Stack(
          children: [
            Container(
              width: 230,
              height: 138,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath), // Your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: "Andika",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "from \$ $price",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: "Andika",
                        ),
                      ),
                      const SizedBox(width: 80),
                      Row(
                        children: [
                          Text(
                            "$rate",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: "Andika",
                            ),
                          ),
                          const Icon(Icons.star,
                              color: Color(0xffF7B701), size: 15),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalList2() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: model2List.length,
        itemBuilder: (context, index) {
          final model = model2List[index];
          return _buildImageCard2(
            model.imagePathg,
            model.title,
            model.location,
          );
        },
      ),
    );
  }

  Widget _buildImageCard2(String imagePath, String text, double location) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Container(
              width: 142,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontFamily: "Andika",
                        ),
                      ),
                      Text(
                        "| $location | locations",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontFamily: "Andika",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomAppBar() {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.home),
            color: const Color(0xFF0373F3), // Special color for Home icon
            onPressed: () {
              // Handle Home icon press
            },
          ),
          IconButton(
            icon: const Icon(Icons.wallet),
            color: const Color(0xFFBCBCBC), // Default color for other icons
            onPressed: () {
              // Handle Wallet icon press
            },
          ),
          IconButton(
            icon: const Icon(Icons.circle),
            color: const Color(0xFFBCBCBC), // Default color for other icons
            onPressed: () {
              // Handle Guide icon press
            },
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart),
            color: const Color(0xFFBCBCBC), // Default color for other icons
            onPressed: () {
              // Handle Chart icon press
            },
          ),
        ],
      ),
    );
  }
}
