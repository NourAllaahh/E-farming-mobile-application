import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:efarm/AgroMarket/Cart.dart';
import 'package:efarm/Farming%20Guide/InterstedList.dart';
import 'package:efarm/Firebase%20Services/FirebaseServices.dart';
import 'package:efarm/PDD/PDDModel.dart';
import 'package:efarm/Sources/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomActionBar extends StatelessWidget {
  final String title;
  final bool hasBackArrow;
  final bool hasTitle;
  final bool hasBackground;
  final bool hasCartIcon;
  final bool hasPDDIcon;
  CustomActionBar(
      {this.title,
      this.hasBackArrow,
      this.hasTitle,
      this.hasBackground,
      this.hasCartIcon,
      this.hasPDDIcon});
  FirebaseServices _firebaseServices = FirebaseServices();
  final CollectionReference _usersRef =
      FirebaseFirestore.instance.collection("Users");

  @override
  Widget build(BuildContext context) {
    bool _hasBackArrow = hasBackArrow ?? false;
    bool _hasTitle = hasTitle ?? true;
    bool _hasBackground = hasBackground ?? true;
    bool _hasCartIcon = hasCartIcon ?? true;
    bool _hasPDDIcon = hasPDDIcon ?? false;

    return Container(
      decoration: BoxDecoration(
          gradient: _hasBackground
              ? LinearGradient(colors: [
                  Colors.white,
                  Colors.white.withOpacity(0),
                ], begin: Alignment(0, 0), end: Alignment(0, 1))
              : null),
      padding: EdgeInsets.only(
        top: 56.0,
        bottom: 42.0,
        left: 24.0,
        right: 24.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_hasBackArrow)
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 42.0,
                height: 42.0,
                decoration: BoxDecoration(
                  color: Colors.green[900],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            ),
          if (_hasTitle)
            Text(
              title ?? "ActionBar",
              style: Constants.boldHeading,
            ),
          if (_hasPDDIcon)
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InterstedList()));
              },
              child: Container(
                width: 42.0,
                height: 42.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Image.asset(
                  'images/Logos/PlantDiseasesLogos/DiseasesGuide.png',
                ),
              ),
            ),
          if (_hasCartIcon)
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
              child: Container(
                  width: 42.0,
                  height: 42.0,
                  decoration: BoxDecoration(
                    color: Colors.green[900],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  alignment: Alignment.center,
                  child: StreamBuilder(
                    stream: _usersRef
                        .doc(_firebaseServices.getUserId())
                        .collection("Cart")
                        .snapshots(),
                    builder: (context, snapshot) {
                      int totalitems = 0;

                      if (snapshot.connectionState == ConnectionState.active) {
                        List _documents = snapshot.data.docs;
                        totalitems = _documents.length;
                      }

                      return Text(
                        "$totalitems" ?? "0",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      );
                    },
                  )),
            )
        ],
      ),
    );
  }
}
