import 'package:efarm/INFOPages/AboutBottomBar.dart';
import 'package:efarm/Sources/constants.dart';

import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  AboutState createState() => AboutState();
}

class AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     bottomNavigationBar: AboutBottomNavBar(),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 30.0,
                ),
                child: Text(
                  "ABOUT US!,\nE-FAMRING",
                  textAlign: TextAlign.center,
                  style: Constants.boldHeading,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Copyrights © E-Farming, 2021",
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.green[600],
                      fontWeight: FontWeight.w200),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  'E-FARMING is an organization that thoughtfully begun to think about how we can develop and spread such an important industry and habit among people, especially with the technology evolution. we thought about making an application that would help people learn more, discover more and practice more planting techniques in their daily lives. This application will be a very helpful assistant to anyone who would want to start planting even small tree in front of their house and for the farmers to get tools and learn more about plants that they do not know much about. This application consists of many useful functions like Agro-market, Plant Diseases Detection, Soil Picker, Farming tips customized for users and a Guide for plants diseases.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  'EF-Version 1.0',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.red[600],
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

AnimatedContainer buildContainerAvatar(double mdw) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 500),
    height: 100,
    width: 100,
    decoration: BoxDecoration(
        color: Colors.green[900],
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 3, spreadRadius: 0.1)
        ]),
    child: InkWell(
      onTap: () {},
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 25,
              right: 25,
              child: Icon(Icons.person_outline, size: 50, color: Colors.white)),
          Positioned(
              top: 30,
              left: 60,
              child: Icon(Icons.add, size: 30, color: Colors.white))
        ],
      ),
    ),
  );
}
