import 'package:efarm/Sources/Boarding/PDDBoarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class PDDSpalsh extends StatefulWidget {
  @override
  _PDDSpalshState createState() => _PDDSpalshState();
}

class _PDDSpalshState extends State<PDDSpalsh> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
    
      backgroundColor: Colors.white,
      image: Image.asset("images/Splash/PDDSplash.png"),
      photoSize: 150.0,
      loaderColor: Colors.green,
      navigateAfterSeconds: PDDBoarding(),
      loadingText: Text(
        "Powerd by E-Farming©",
        style: new TextStyle(color: Colors.black, fontSize: 15.0),
      ),
    );
  }
}
