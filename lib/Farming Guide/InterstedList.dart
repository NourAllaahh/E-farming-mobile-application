import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:efarm/Farming%20Guide/FarmingDetails.dart';
import 'package:efarm/Firebase%20Services/FirebaseServices.dart';
import 'package:efarm/Sources/MarketWidgets/CustomActionBar.dart';
import 'package:flutter/material.dart';

class InterstedList extends StatefulWidget {
  @override
  InterstedListState createState() => InterstedListState();
}

class InterstedListState extends State<InterstedList> {
  FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<QuerySnapshot>(
              future: _firebaseServices.usersRef
                  .doc(_firebaseServices.getUserId())
                  .collection("InterstedList")
                  .get(),
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
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FarmingDetails(CropId: document.id)));
                        },
                        child: FutureBuilder(
                          future:
                              _firebaseServices.cropRef.doc(document.id).get(),
                          builder: (context, productSnap) {
                            if (productSnap.hasError) {
                              return Container(
                                child: Center(
                                  child: Text("${productSnap.error}"),
                                ),
                              );
                            }
                            if (productSnap.connectionState ==
                                ConnectionState.done) {
                              Map _productMap = productSnap.data.data();
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                  horizontal: 24.0,
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 90,
                                          height: 90,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              "${_productMap['CropLogo']}",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                            left: 16.0,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${_productMap['CropName']}",
                                                style: TextStyle(
                                                    fontSize: 11.0,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 4.0,
                                                ),
                                                child: Text(
                                                  "${_productMap['CropSeason']}",
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: Colors.green[900],
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }

                            return Container(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                        ),
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
            hasPDDIcon: true,
            hasBackArrow: true,
            hasCartIcon: false,
            hasTitle: true,
            title: "Intersted List",
          ),
        ],
      ),
    );
  }
}
