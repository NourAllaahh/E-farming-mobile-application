import 'package:efarm/SoilPicker/SoilModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SoilSpalsh extends StatefulWidget {
  @override
  _SoilSpalshState createState() => _SoilSpalshState();
}

class _SoilSpalshState extends State<SoilSpalsh> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      backgroundColor: Colors.white,
      image: Image.asset("images/Splash/SoilPickerSplash.png"),
      photoSize: 150.0,
      loaderColor: Colors.green,
      navigateAfterSeconds: SoilModel(),
      loadingText: Text(
        "Powerd by E-Farming©",
        style: new TextStyle(color: Colors.black, fontSize: 15.0),
      ),
    );
  }
}
