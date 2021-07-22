
import 'package:efarm/AgroMarket/CommonTabs/SearchTab.dart';
import 'package:efarm/DiseasesGuide/DiseasesGuide.dart';
import 'package:efarm/DiseasesGuide/DiseasesSearch.dart';
import 'package:efarm/Firebase%20Services/FirebaseServices.dart';
import 'package:efarm/PDD/PDDModel.dart';

import 'package:efarm/Sources/BottomTabs.dart';
import 'package:efarm/Sources/DiseasesGuideWidgets/DiseasesBottomTabs.dart';

import 'package:flutter/material.dart';

class DiseasesHome extends StatefulWidget {
  @override
  DiseasesHomeState createState() => DiseasesHomeState();
}

class DiseasesHomeState extends State<DiseasesHome> {
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
            DiseasesGuide(),
            PDDModel(),
            DiseasesSearch(),
          
          
              ],
            ),
          ),
        ),
       DiseasesBottomTabs(
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
