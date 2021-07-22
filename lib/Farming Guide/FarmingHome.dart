import 'package:efarm/Farming%20Guide/FarmingGuide.dart';
import 'package:efarm/Firebase%20Services/FirebaseServices.dart';
import 'package:flutter/material.dart';

class FarmingHome extends StatefulWidget {
  @override
  FarmingHomeState createState() => FarmingHomeState();
}

class FarmingHomeState extends State<FarmingHome> {
  FirebaseServices _firebaseServices = FirebaseServices();

  PageController tabPageController; //to control pages
  int selectedTab = 0;
  @override
  void initState() {
    tabPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    tabPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Expanded(
            child: PageView(
              controller: tabPageController,
              onPageChanged: (num) {
                setState(() {
                  selectedTab = num;
                });
              },
              children: [
                FarmingGuide(),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
