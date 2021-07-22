import 'package:carousel_pro/carousel_pro.dart';
import 'package:efarm/AgroMarket/Cart.dart';
import 'package:efarm/Home/ServicesCard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MarketHome extends StatefulWidget {
  State<StatefulWidget> createState() {
    return MarketHomeState();
  }
}

class MarketHomeState extends State<MarketHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AGRO-Market",
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false,

        backgroundColor: Colors.white,
      
        centerTitle: false, // put the title in the middle
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: Container(
         color: Colors.white,
        child: ListView(
          
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.green),
              padding: EdgeInsets.all(10),
              child: Text(
                "Know Everything About The Agriculture Market!!",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
             Container(
              height: 150,
              width: 150,
              child: Carousel(
                images: [
                  Image.asset('images/MarketHome/MarketSlider/MarketSlider2.png',
                      fit: BoxFit.cover),
                  Image.asset('images/MarketHome/MarketSlider/MarketSlider3.png',
                      fit: BoxFit.cover),
                  Image.asset('images/MarketHome/MarketSlider/MarketSlider4.png',
                      fit: BoxFit.cover),
                ],
                dotColor: Colors.white,
                dotBgColor: Colors.black.withOpacity(0.5),
                dotIncreasedColor: Colors.green,
              ),
            ),
            Container(
                height: 130,
                child:
                    ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 100,
                      width: 100,
                      child: ListTile(
                        title: Image.asset(
                          'images/Logos/MarketLogos/deals.png',
                          width: 50,
                          height: 50,
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "DEALS",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 11),
                            )),
                        onTap: () {},
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 100,
                      width: 100,
                      child: ListTile(
                        title: Image.asset(
                          'images/Logos/MarketLogos/promotion.png',
                          width: 50,
                          height: 50,
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "PROMOTION",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 9.6),
                            )),
                        onTap: () {},
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 100,
                      width: 100,
                      child: ListTile(
                        title: Image.asset(
                          'images/Logos/MarketLogos/cart.png',
                          width: 50,
                          height: 50,
                        ),
                        subtitle: Container(
                          padding: EdgeInsets.only(top: 15),
                          child: Text(
                            "CART",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cart()));
                        },
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 100,
                      width: 100,
                      child: ListTile(
                        title: Image.asset(
                          'images/Logos/MarketLogos/Support.png',
                          width: 50,
                          height: 50,
                        ),
                        subtitle: Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              "ASK US",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 11),
                            )),
                        onTap: () {},
                      )),
                ])),
           

            //end ser
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Categories",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.green[600],
                    fontWeight: FontWeight.bold),
              ),
            ),
            //Start Categories
            Container(
              height: 400,
              child: GridView(

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
                children: <Widget>[
                  CategoryCard(
                    title: "Heavy Tools",
                    imageSrc: "images/MarketHome/HeavyToolsHome.png",
                    press: () {
                      Navigator.of(context).pushNamed('HeavyHome');
                    },
                  ),
                  CategoryCard(
                    title: "Light Tools",
                    imageSrc: "images/MarketHome/LightToolsHome.png",
                    press: () {
                      Navigator.of(context).pushNamed('LightHome');
                    },
                  ),
                  CategoryCard(
                    title: "Seeds",
                    imageSrc: "images/MarketHome/SeedsHome.png",
                    press: () {
                      Navigator.of(context).pushNamed('SeedsHome');
                    },
                  ),
                  CategoryCard(
                    title: "Fertilizers",
                    imageSrc: "images/MarketHome/FertilizersHome.png",
                    press: () {
                      Navigator.of(context).pushNamed('ItemsHome');
                    },
                  ),
                ],
              ),
            ),

            //end
          ],
        ),
      ),
    );
  }
}
