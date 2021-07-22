import 'package:efarm/Sources/CustomBtn.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseLevel extends StatefulWidget {
  ChooseLevel({Key key}) : super(key: key);

  @override
  _ChooseLevelState createState() => _ChooseLevelState();
}

class _ChooseLevelState extends State<ChooseLevel> {
  savePref(String level) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("level", level);
    print(preferences.getString("level"));
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var level = preferences.getString("level");
    if (level != null) {
      Navigator.of(context).pushNamed('HomePage');
    }
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Center(
            child: Container(
              child: Image.asset("images/HomePage/SelectLevel3.png"),
              padding: EdgeInsets.only(bottom: 30),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 0),
            child: Image.asset("images/HomePage/SelectLevel1.png"),
          ),
          Center(
              child: Container(
            padding: EdgeInsets.only(top: 60),
            child: Text(
              "Choose What Describe You Best",
              style: TextStyle(fontSize: 20, color: Colors.grey[600]),
            ),
          )),
          Column(
            children: <Widget>[
              CustomBtn(
                text: "I Grow Crops In Pots",
                outlineBtn: true,
                onPressed: () {
                  savePref("A");
                   getPref();
                },
              ),
              CustomBtn(
                text: "I Grow Crops In My Home Garden",
                outlineBtn: true,
                onPressed: () {
                  savePref("B");
                   getPref();
                },
              ),
              CustomBtn(
                text: "I Grow Crops In Fields",
                outlineBtn: true,
                onPressed: () {
                  savePref("C");
                   getPref();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
