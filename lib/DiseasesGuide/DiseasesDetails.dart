import 'package:efarm/Firebase%20Services/FirebaseServices.dart';
import 'package:efarm/Sources/CustomBtn.dart';
import 'package:efarm/Sources/MarketWidgets/CustomActionBar.dart';
import 'package:efarm/Sources/MarketWidgets/ImagesSwap.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class DiseasesDetails extends StatefulWidget {
  final String DiseasesId;
  DiseasesDetails({this.DiseasesId});

  @override
  DiseasesDetailsState createState() => DiseasesDetailsState();
}

class DiseasesDetailsState extends State<DiseasesDetails> {
  FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: _firebaseServices.diseasesref.doc(widget.DiseasesId).get(),
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
                List imageList = documentData['DisPics'];

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
                        "${documentData['DisName']}" ?? "DisName",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.w100),
                      ),
                    ),
                    ExpandableNotifier(
                              child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 150,
                                    width: 400,
                                    child: Container(
                                      child: Image.asset(
                                        "images/PDD/Causes.jpeg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  ScrollOnExpand(
                                    scrollOnExpand: true,
                                    scrollOnCollapse: false,
                                    child: ExpandablePanel(
                                      theme: const ExpandableThemeData(
                                        headerAlignment:
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        tapBodyToCollapse: true,
                                      ),
                                      header: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                              "What Cause it ?",
                                              style: TextStyle(
                                                  color: Colors.grey[600]))),
                                      collapsed: Text(
                                        "Tap To Know More",
                                        softWrap: true,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      expanded: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 10),
                                              child: Text(
                                                "${documentData['DisCause']}",
                                                textAlign: TextAlign.justify,
                                              )),
                                        ],
                                      ),
                                      builder: (_, collapsed, expanded) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10, bottom: 10),
                                          child: Expandable(
                                            collapsed: collapsed,
                                            expanded: expanded,
                                            theme: const ExpandableThemeData(
                                                crossFadePoint: 0),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                   ExpandableNotifier(
                              child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 150,
                                    width: 400,
                                    child: Container(
                                      child: Image.asset(
                                        "images/PDD/Organic.jpeg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  ScrollOnExpand(
                                    scrollOnExpand: true,
                                    scrollOnCollapse: false,
                                    child: ExpandablePanel(
                                      theme: const ExpandableThemeData(
                                        headerAlignment:
                                            ExpandablePanelHeaderAlignment
                                                .center,
                                        tapBodyToCollapse: true,
                                      ),
                                      header: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                              "Solution",
                                              style: TextStyle(
                                                  color: Colors.grey[600]))),
                                      collapsed: Text(
                                        "Tap To Know More",
                                        softWrap: true,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      expanded: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 10),
                                              child: Text(
                                                "${documentData['DisSolution']}",
                                                textAlign: TextAlign.justify,
                                              )),
                                        ],
                                      ),
                                      builder: (_, collapsed, expanded) {
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10, bottom: 10),
                                          child: Expandable(
                                            collapsed: collapsed,
                                            expanded: expanded,
                                            theme: const ExpandableThemeData(
                                                crossFadePoint: 0),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                   
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
            hasCartIcon: false,
            hasBackground: false,
          )
        ],
      ),
    );
  }
}
