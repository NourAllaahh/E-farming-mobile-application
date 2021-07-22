import 'package:efarm/AgroMarket/HeavyHome.dart';
import 'package:efarm/AgroMarket/ItemsHome.dart';
import 'package:efarm/AgroMarket/Markethome.dart';
import 'package:efarm/AgroMarket/SeedsHome.dart';
import 'package:efarm/HarvestTimer/HarvestHome.dart';
import 'package:efarm/Home/ChooseLevel.dart';
import 'package:efarm/Farming%20Guide/FarmingHome.dart';
import 'package:efarm/Farming%20Guide/InterstedList.dart';
import 'package:efarm/Home/HomePage.dart';
import 'package:efarm/INFOPages/Contact.dart';
import 'package:efarm/INFOPages/Foryou.dart';
import 'package:efarm/Sources/Boarding/PDDBoarding.dart';
import 'package:efarm/SplashScreens/Marketsplash.dart';
import 'package:efarm/SplashScreens/PDDsplash.dart';
import 'package:efarm/SplashScreens/SoilSplash.dart';
import 'package:efarm/SplashScreens/StartSplash.dart';
import 'package:flutter/material.dart';
import 'package:efarm/INFOPages/About.dart';
import 'AgroMarket/LightHome.dart';
import 'DiseasesGuide/DiseasesHome.dart';


void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //  the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Poppins',
            accentColor: Colors.green,
            primarySwatch: Colors.green),
        home: StartSpalsh(),
        routes: {
          'PDDSplash': (context) {
            return PDDSpalsh();
          },
          'SoilSplash': (context) {
            return SoilSpalsh();
          },
          'MarketSplash': (context) {
            return MarketSpalsh();
          },
          'HomePage': (context) {
            return HomePage();
          },
          'About': (context) {
            return About();
          },
          'FarmerGuide': (context) {
            return Foryou();
          },
          'MarketHome': (context) {
            return MarketHome();
          },
          'Contact': (context) {
            return Contact();
          },
          'HeavyHome': (context) {
            return HeavyHome();
          },
          'HarvestHome': (context) {
            return HarvestHome();
          },
          'LightHome': (context) {
            return LightHome();
          },
          'SeedsHome': (context) {
            return SeedsHome();
          },
          'ItemsHome': (context) {
            return ItemsHome();
          },
          'FarmingHome': (context) {
            return FarmingHome();
          },
          'DiseasesHome': (context) {
            return DiseasesHome();
          },
          'InterstedList': (context) {
            return InterstedList();
          },
          'PDDBoarding': (context) {
            return PDDBoarding();
          },
          'ChooseLevel': (context) {
            return ChooseLevel();
          },
        });
  }
}
