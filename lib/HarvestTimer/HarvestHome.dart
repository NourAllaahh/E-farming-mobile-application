import 'package:efarm/DiseasesGuide/DiseasesSearch.dart';
import 'package:efarm/Firebase%20Services/FirebaseServices.dart';
import 'package:efarm/HarvestTimer/HarvestTimer.dart';
import 'package:efarm/Sources/HarvestTimer/HarvestBottomTabs.dart';
import 'package:flutter/material.dart';

class HarvestHome extends StatefulWidget {
  @override
  HarvestHomeState createState() => HarvestHomeState();
}

class HarvestHomeState extends State<HarvestHome> {
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
              children:[
           HarvestTimer(),
            
          
          
              ],
            ),
          ),
        ),
       HarvestBottomTabs(
          selectedTabs: selectedTab,
          tabpressed: (num) {
            tabPageController.animateToPage(num,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOutCubic);
          },
        ),
      ],
    ));
  }
}
