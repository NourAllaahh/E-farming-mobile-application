import 'package:efarm/Home/HomePageConstants.dart';
import 'package:flutter/material.dart';



class AboutBottomNavBar extends StatelessWidget {
  const AboutBottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BottomNavItem(
            title: "CONTACT US",
            imageScr: 'images/Logos/Contactus.png',
            press: () {
              Navigator.of(context).pushNamed('Contact');
            },
          ),
          BottomNavItem(
            title: "HOME PAGE",
            imageScr: 'images/Logos/Home.png',
           press: () {
              Navigator.of(context).pushNamed('HomePage');
            },
          ),
          BottomNavItem(
            title: "ABOUT US",
            imageScr: 'images/Logos/aboutus.png',
               isActive: true,
         
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final String imageScr;
  final String title;
  final Function press;
  final bool isActive;
  const BottomNavItem({
    Key key,
    this.imageScr,
    this.title,
    this.press,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Image.asset(
            imageScr,
            width: 30,
            color: isActive ? Colors.green : kTextColor,
          ),
          Text(
            title,
            style: TextStyle(color: isActive ? Colors.green : kTextColor),
          ),
        ],
      ),
    );
  }
}
