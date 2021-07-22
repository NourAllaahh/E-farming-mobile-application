import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:efarm/AuthPages/loginpage.dart';
import 'package:efarm/Firebase%20Services/FirebaseServices.dart';
import 'package:efarm/Sources/MyDrawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'HomeBottomBar.dart';
import 'ServicesCard.dart';

class HomePage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  FirebaseServices _firebaseServices = FirebaseServices();
  final CollectionReference _usersRef =
      FirebaseFirestore.instance.collection("Users");

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Container(
              child: StreamBuilder(
                stream: _usersRef
                    .doc(_firebaseServices.getUserId())
                    .collection("InterstedList")
                    .snapshots(),
                builder: (context, snapshot) {
                  int totalitems = 0;

                  if (snapshot.connectionState == ConnectionState.active) {
                    List _documents = snapshot.data.docs;
                    totalitems = _documents.length;
                  }

                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('InterstedList');
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Image.asset(
                            "images/Logos/PlantDiseasesLogos/DiseasesGuide.png",
                            width: 30,
                            height: 30,
                            alignment: Alignment.center,
                          ),
                          Text(
                            "$totalitems" ?? "0",
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              alignment: Alignment.center,
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
        centerTitle: true, // put the title in the middle
        elevation: 0,
        brightness: Brightness.light,
        automaticallyImplyLeading: true,
      ),
      bottomNavigationBar: BottomNavBar(),
      drawer: MyDrawer(),
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("images/HomePage/HomePageBG.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "WELCOME TO \n E-FARMING",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "FOR YOU",
                          imageSrc: "images/HomePage/FarmerGuide.png",
                          press: () {
                            Navigator.of(context).pushNamed('FarmerGuide');
                          },
                        ),
                        CategoryCard(
                          title: "FARMING TIPS",
                          imageSrc: "images/HomePage/FarmingTipsHP.png",
                          press: () {
                            Navigator.of(context).pushNamed('FarmingHome');
                          },
                        ),
                       
                        CategoryCard(
                          title: "PLANT SCANNER",
                          imageSrc: "images/Splash/PDDSplash.png",
                          press: () {
                            Navigator.of(context).pushNamed("PDDSplash");
                          },
                        ),
                          CategoryCard(
                          title: "SOIL PICKER",
                          imageSrc: "images/HomePage/SoilPicker.png",
                          press: () {
                            Navigator.of(context).pushNamed("SoilSplash");
                          },
                        ),
                         CategoryCard(
                          title: "AGRO-MARKET",
                          imageSrc: "images/Splash/MarketSplash1.png",
                          press: () {
                            Navigator.of(context).pushNamed("MarketSplash");
                          },
                        ),
                        CategoryCard(
                          title: "DISEASES GUIDE",
                          imageSrc: "images/HomePage/DiseasesGuide.png",
                          press: () {
                            Navigator.of(context).pushNamed("DiseasesHome");
                          },
                        ),
                        
                      
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
