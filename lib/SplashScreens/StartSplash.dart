import 'package:efarm/Sources/Boarding/PDDBoarding.dart';
import 'package:efarm/Sources/LandingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:custom_splash/custom_splash.dart';

class StartSpalsh extends StatefulWidget {
  @override
  _StartSpalshState createState() => _StartSpalshState();
}

class _StartSpalshState extends State<StartSpalsh> {
  @override
  Widget build(BuildContext context) {
    return CustomSplash(
      home: LandingPage(),
      imagePath: "images/Splash/MainSplash.png",
      backGroundColor: Colors.white,
      animationEffect: 'fade-in',
      logoSize: 200,
      duration: 2500,
      type: CustomSplashType.StaticDuration,
    );
  }
}
