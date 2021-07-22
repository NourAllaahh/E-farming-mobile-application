import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:efarm/Firebase%20Services/FirebaseServices.dart';
import 'package:efarm/Sources/CustomInput.dart';
import 'package:efarm/Sources/DiseasesGuideWidgets/DiseasesCard.dart';
import 'package:efarm/Sources/constants.dart';
import 'package:flutter/material.dart';

class DiseasesSearch extends StatefulWidget {
  @override
  _DiseasesSearchState createState() => _DiseasesSearchState();
}

class _DiseasesSearchState extends State<DiseasesSearch> {
  FirebaseServices _firebaseServices = FirebaseServices();

  String searchString = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          if (searchString.isEmpty)
           FutureBuilder<QuerySnapshot>(
                    future: _firebaseServices.diseasesref.get(),
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
                      return DiseasesCard(
                        title: document.data()['DisName'],
                        imageUrl: document.data()["DisPics"][0],
                        target: document.data()['DisTarget'],
                       diseasestId: document.id,
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
                    })
          else
            FutureBuilder<QuerySnapshot>(
                    future: _firebaseServices.diseasesref
                        .orderBy("DisName")
                        .startAt([searchString]).endAt(
                            ["$searchString\uf8ff"]).get(),
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
                      return DiseasesCard(
                        title: document.data()['DisName'],
                        imageUrl: document.data()["DisPics"][0],
                        target: document.data()['DisTarget'],
                       diseasestId: document.id,
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
          Padding(
            padding: const EdgeInsets.only(top: 45.0),
            child: CustomInput(
              hintText: ("Search here...."),
              onSubmitted: (value) {
                setState(() {
                  searchString = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
