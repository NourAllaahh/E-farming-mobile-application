import 'package:efarm/Firebase%20Services/FirebaseServices.dart';
import 'package:efarm/Sources/CustomBtn.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FarmingDetails extends StatefulWidget {
  final String CropId;
  FarmingDetails({this.CropId});

  @override
  FarmingDetailsState createState() => FarmingDetailsState();
}

class FarmingDetailsState extends State<FarmingDetails> {
  FirebaseServices _firebaseServices = FirebaseServices();
  Future addToInterstedList() {
    return _firebaseServices.usersRef
        .doc(_firebaseServices.getUserId())
        .collection("InterstedList")
        .doc(widget.CropId)
        .set({"CropId": widget.CropId});
  }

  removeFromInterstedList() async {
    return _firebaseServices.usersRef
        .doc(_firebaseServices.getUserId())
        .collection("InterstedList")
        .doc(widget.CropId)
        .delete();
  }

  final SnackBar interestedaddSnackBar = SnackBar(
    content: Text("Item Added To interested List"),
  );
  final SnackBar notinterestedSnackBar = SnackBar(
    content: Text("Item Removed From interested List"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cultivation Tips",
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: false, // put the title in the middle
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: Stack(
        children: [
          FutureBuilder(
            future: _firebaseServices.cropRef.doc(widget.CropId).get(),
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
                List imageList = documentData['CropImages'];

                return Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 20, bottom: 0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    right: 12, left: 20, bottom: 20),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                  alignment: Alignment.center,
                                  child: Image.network(
                                    "${documentData['CropLogo']}",
                                    height: 40,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 0, bottom: 20),
                                child: Container(
                                  child: Text(
                                    "${documentData['CropName']}\ Tips",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 120),
                                child: GestureDetector(
                                  onTap: () async {
                                    await addToInterstedList();
                                    Scaffold.of(context)
                                        .showSnackBar(interestedaddSnackBar);
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(12.0)),
                                    alignment: Alignment.center,
                                    child: Image(
                                      image: AssetImage(
                                          "images/Logos/InterstedLogo.png"),
                                      height: 22.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10, left: 20),
                            child: Row(
                              children: [
                                Container(
                                    child: Text(
                                  "Season: ",
                                  style: TextStyle(color: Colors.red),
                                )),
                                Container(
                                    child:
                                        Text("${documentData['CropSeason']}")),
                              ],
                            ),
                          ),
                          //Crop Selection
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
                                      child: Image.network(
                                        "${documentData['CropImages'][0]}",
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
                                              "${documentData['SelectionDue']}",
                                              style: TextStyle(
                                                  color: Colors.grey[600]))),
                                      collapsed: Text(
                                        "${documentData['CropName']}\ Seeds Selection",
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
                                                "${documentData['CropSelection']}",
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
                          //Crop Planting
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
                                      child: Image.network(
                                        "${documentData['CropImages'][1]}",
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
                                              "${documentData['PlantingDue']}",
                                              style: TextStyle(
                                                  color: Colors.grey[600]))),
                                      collapsed: Text(
                                        "${documentData['CropName']}\ Planting",
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
                                                "${documentData['CropPlanting']}",
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
                          //Crop Monitoring
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
                                      child: Image.network(
                                        "${documentData['CropImages'][2]}",
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
                                              "${documentData['MonitoringDue']}",
                                              style: TextStyle(
                                                  color: Colors.grey[600]))),
                                      collapsed: Text(
                                        "${documentData['CropName']}\ Monitoring",
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
                                                "${documentData['CropMonitoring']}",
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
                          //Crop Protection
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
                                      child: Image.network(
                                        "${documentData['CropImages'][3]}",
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
                                              "${documentData['ProtectionDue']}",
                                              style: TextStyle(
                                                  color: Colors.grey[600]))),
                                      collapsed: Text(
                                        "${documentData['CropName']}\ Protection",
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
                                                "${documentData['CropProtection']}",
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
                          //Crop Weeding
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
                                      child: Image.network(
                                        "${documentData['CropImages'][4]}",
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
                                              "${documentData['WeedingDue']}",
                                              style: TextStyle(
                                                  color: Colors.grey[600]))),
                                      collapsed: Text(
                                        "${documentData['CropName']}\ Weeding",
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
                                                "${documentData['CropWeeding']}",
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
                          //Crop Harvest
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
                                      child: Image.network(
                                        "${documentData['CropImages'][5]}",
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
                                              "${documentData['HarvestDue']}",
                                              style: TextStyle(
                                                  color: Colors.grey[600]))),
                                      collapsed: Text(
                                        "${documentData['CropName']}\ Harvesting",
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
                                                "${documentData['CropHarvest']}",
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
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: CustomBtn(
                                    text: "Not interested",
                                    onPressed: () {
                                      removeFromInterstedList();
                                      Scaffold.of(context)
                                          .showSnackBar(notinterestedSnackBar);
                                    },
                                    outlineBtn: true,
                                  ),
                                )
                              ],
                            ),
                          )
                        ]),
                  ),
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
        ],
      ),
    );
  }
}
