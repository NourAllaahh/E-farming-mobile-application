import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:efarm/Firebase%20Services/FirebaseServices.dart';
import 'package:efarm/Sources/CustomInput.dart';
import 'package:efarm/Sources/MarketWidgets/ProductsCard.dart';
import 'package:flutter/material.dart';

class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  FirebaseServices _firebaseServices = FirebaseServices();

  String searchString = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          if (searchString.isEmpty)
           FutureBuilder<QuerySnapshot>(
                    future: _firebaseServices.productsref.get(),
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
                          padding: EdgeInsets.only(top: 128.0, bottom: 12.0),
                          children: snapshot.data.docs.map((document) {
                            return ProductsCard(
                              title: document.data()['ProdName'],
                              imageUrl: document.data()["ProdImages"][0],
                              price: "${document.data()["ProdPrice"]}",
                              productId: document.id,
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
                    future: _firebaseServices.productsref
                        .orderBy("ProdName")
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
                          padding: EdgeInsets.only(top: 128.0, bottom: 12.0),
                          children: snapshot.data.docs.map((document) {
                            return ProductsCard(
                              title: document.data()['ProdName'],
                              imageUrl: document.data()["ProdImages"][0],
                              price: "${document.data()["ProdPrice"]}",
                              productId: document.id,
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
