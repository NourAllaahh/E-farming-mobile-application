import 'package:efarm/AgroMarket/MarketHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class MarketSpalsh extends StatefulWidget {
  @override
  _MarketSpalshState createState() => _MarketSpalshState();
}

class _MarketSpalshState extends State<MarketSpalsh> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      backgroundColor: Colors.white,
      image: Image.asset("images/Splash/MarketSplash1.png"),
      photoSize: 150.0,
      loaderColor: Colors.green,
      navigateAfterSeconds: MarketHome(),
      loadingText: Text(
        "Powerd by E-Farming©",
        style: new TextStyle(color: Colors.black, fontSize: 15.0),
      ),
    );
  }
}