import 'package:efarm/Firebase%20Services/FirebaseServices.dart';
import 'package:efarm/Sources/CustomBtn.dart';
import 'package:efarm/Sources/MarketWidgets/CustomActionBar.dart';
import 'package:efarm/Sources/MarketWidgets/ImagesSwap.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final String ProductId;
  ProductDetails({this.ProductId});

  @override
  ProductDetailsState createState() => ProductDetailsState();
}

class ProductDetailsState extends State<ProductDetails> {
  FirebaseServices _firebaseServices = FirebaseServices();

  Future addToCart() {
    return _firebaseServices.usersRef
        .doc(_firebaseServices.getUserId())
        .collection("Cart")
        .doc(widget.ProductId)
        .set({"ProductId": widget.ProductId});
  }

  removeFromCart() async {
    return _firebaseServices.usersRef
        .doc(_firebaseServices.getUserId())
        .collection("Cart")
        .doc(widget.ProductId)
        .delete();
  }

  Future addToFavorite() {
    return _firebaseServices.usersRef
        .doc(_firebaseServices.getUserId())
        .collection("Favorite")
        .doc(widget.ProductId)
        .set({"ProductId": widget.ProductId});
  }

  final SnackBar cartaddSnackBar = SnackBar(
    content: Text("Item Added To Cart"),
  );
  final SnackBar favoriteSnackBar = SnackBar(
    content: Text("Item Added To Favorite"),
  );
  final SnackBar cartremoveSnackBar = SnackBar(
    content: Text("Item Removed From Cart"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: _firebaseServices.productsref.doc(widget.ProductId).get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.done) {
                //firebase data document map
                Map<String, dynamic> documentData = snapshot.data.data();
                //list of images
                List imageList = documentData['ProdImages'];

                return ListView(
                  padding: EdgeInsets.all(0),
                  children: [
                    ImagesSwap(
                      imageList: imageList,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 24.0, left: 24.0, right: 24.0, bottom: 5.0),
                      child: Text(
                        "${documentData['ProdName']}" ?? "ProductName",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w100),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 24.0),
                      child: Text(
                        "${documentData['ProdPrice']}\ LE",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 24.0),
                      child: Text(
                        "${documentData['ProdDesc0']}" ?? 'Desc',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w100),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 24.0),
                      child: Text(
                        "${documentData['ProdDesc1']}",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w100),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 24.0),
                      child: Text(
                        "${documentData['ProdDesc2']}"?? 'Weight',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w100),
                      ) 
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () async {
                                await addToFavorite();
                                Scaffold.of(context)
                                    .showSnackBar(favoriteSnackBar);
                              },
                              child: Container(
                                width: 65,
                                height: 64,
                                decoration: BoxDecoration(
                                    color: Colors.green[900],
                                    borderRadius: BorderRadius.circular(12.0)),
                                alignment: Alignment.center,
                                child: Image(
                                  image: AssetImage(
                                      "images/Logos/MarketLogos/Saved.png"),
                                  height: 22.0,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await removeFromCart();
                              Scaffold.of(context)
                                  .showSnackBar(cartremoveSnackBar);
                            },
                            child: Container(
                                width: 65,
                                height: 64,
                                decoration: BoxDecoration(
                                    color: Colors.red[800],
                                    borderRadius: BorderRadius.circular(12.0)),
                                alignment: Alignment.center,
                                child: Icon(Icons.remove)),
                          ),
                          Expanded(
                            child: CustomBtn(
                              text: "ADD TO CART",
                              onPressed: () {
                              addToCart();
                                Scaffold.of(context)
                                    .showSnackBar(cartaddSnackBar);
                              },
                              outlineBtn: true,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }
              //Loading
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
          CustomActionBar(
            hasBackArrow: true,
            hasTitle: false,
            hasBackground: false,
          )
        ],
      ),
    );
  }
}
