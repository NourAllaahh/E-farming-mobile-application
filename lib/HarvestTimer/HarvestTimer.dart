import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:efarm/Firebase%20Services/FirebaseServices.dart';
import 'package:efarm/Sources/DiseasesGuideWidgets/DiseasesCard.dart';
import 'package:efarm/Sources/MarketWidgets/CustomActionBar.dart';
import 'package:flutter/material.dart';


class HarvestTimer extends StatelessWidget {
  FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [   
          CustomActionBar(
            hasTitle: true,
            title: "Harvest Timer",
            hasBackArrow: false,
            hasCartIcon: false,
            hasPDDIcon: true,
          ),
        ],
      ),
    );
  }
}
