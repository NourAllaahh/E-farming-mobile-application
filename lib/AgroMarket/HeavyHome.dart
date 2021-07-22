import 'package:efarm/AgroMarket/CommonTabs/FavouriteTab.dart';
import 'package:efarm/AgroMarket/CommonTabs/SearchTab.dart';
import 'package:efarm/AgroMarket/ProductTabs/HeavytoolsTab.dart';
import 'package:efarm/Firebase%20Services/FirebaseServices.dart';
import 'package:efarm/Sources/BottomTabs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HeavyHome extends StatefulWidget {
  @override
  HeavyHomeState createState() => HeavyHomeState();
}

class HeavyHomeState extends State<HeavyHome> {
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
            HeavyToolsTab(),
            SearchTab(),
            FavouriteTab(),
              ],
            ),
          ),
        ),
        BottomTabs(
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
