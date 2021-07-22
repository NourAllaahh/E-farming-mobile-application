import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String getUserId() {
    return firebaseAuth.currentUser.uid;
  }

  final CollectionReference productsref =
      FirebaseFirestore.instance.collection("Products");

  final CollectionReference usersRef =
      FirebaseFirestore.instance.collection("Users");
  // user -> UserID(Document) -> Cart -> ProductId(Document)

  final CollectionReference cartRef =
      FirebaseFirestore.instance.collection("Cart");

       final CollectionReference cropRef =
      FirebaseFirestore.instance.collection("Crops");

  final CollectionReference diseasesref =
      FirebaseFirestore.instance.collection("PlantDiseases");
}
