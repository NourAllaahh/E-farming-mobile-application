import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:efarm/Firebase%20Services/FirebaseServices.dart';
import 'package:efarm/Sources/FarmingGuideWidgets/FarmingCard.dart';
import 'package:efarm/Sources/MarketWidgets/CustomActionBar.dart';
import 'package:flutter/material.dart';


class FarmingGuide extends StatelessWidget {
  FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
              future: _firebaseServices.cropRef.get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("Error: ${snapshot.error}"),
                    ),
                  );
                }
                //heavytools ready to dispaly
                if (snapshot.connectionState == ConnectionState.done) {
                  // diaplay the heavytools data
                 
                  return ListView(
                    padding: EdgeInsets.only(top: 108.0, bottom: 12.0),
                    children: snapshot.data.docs.map((document) {
                      return FarmingCard(
                        title: document.data()['CropName'],
                        imageUrl: document.data()["CropLogo"],
                        season: document.data()['CropSeason'],
                       croptId: document.id,
                      );
                    }).toList(),
                  );
                }
                //Loading
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }),
          CustomActionBar(
            hasTitle: true,
            title: "Farming Tips",
            hasBackArrow: false,
            hasCartIcon: false,
            hasPDDIcon: true,
          ),
        ],
      ),
    );
  }
}
