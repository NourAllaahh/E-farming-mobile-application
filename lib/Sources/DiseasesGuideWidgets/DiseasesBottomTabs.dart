import 'package:flutter/material.dart';

class DiseasesBottomTabs extends StatefulWidget {
  final int selectedTabs; // to identify selected tabs with pages
  final Function(int) tabpressed; // to change page when tab is selected
  DiseasesBottomTabs({this.selectedTabs, this.tabpressed});
  @override
  _DiseasesBottomTabsState createState() => _DiseasesBottomTabsState();
}

class _DiseasesBottomTabsState extends State<DiseasesBottomTabs> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    selectedTab = widget.selectedTabs ??
        0; //change selected tab to the tab comes from the widget
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.green.withOpacity(0.6),
                spreadRadius: 1.0,
                blurRadius: 30.0,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DiseasesBottomTabsBtn(
              imagePath: "images/Logos/PlantDiseasesLogos/DiseasesGuide.png",
              selected: selectedTab == 0 ? true : false,
              onPressed: () {
                setState(() {
                  widget.tabpressed(0);
                });
              },
            ),
            DiseasesBottomTabsBtn(
              imagePath: "images/Logos/PlantDiseasesLogos/PDDScan.png",
              selected: selectedTab == 1 ? true : false,
              onPressed: () {
                setState(() {
                  widget.tabpressed(1);
                });
              },
            ),
            DiseasesBottomTabsBtn(
              imagePath: "images/Logos/MarketLogos/search.png",
              selected: selectedTab == 2 ? true : false,
              onPressed: () {
                setState(() {
                  widget.tabpressed(2);
                });
              },
            ),
            DiseasesBottomTabsBtn(
              imagePath: "images/Logos/Logout.png",
              selected: selectedTab == 3 ? true : false,
              onPressed: () {
                setState(() {});
              },
            ),
          ],
        ));
  }
}

class DiseasesBottomTabsBtn extends StatelessWidget {
  final String imagePath;
  final bool selected;
  final Function onPressed;
  DiseasesBottomTabsBtn({this.imagePath, this.selected, this.onPressed});
  @override
  Widget build(BuildContext context) {
    bool select = selected ?? false;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 16.0,
        ),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    color: select
                        ? Theme.of(context).accentColor
                        : Colors.transparent,
                    width: 2))),
        child: Image(
            image: AssetImage(
                imagePath ?? "images/Logos/MarketLogos/heavytools.png"),
            width: 28.0,
            height: 24.0,
            color: select ? Theme.of(context).accentColor : Colors.black),
      ),
    );
  }
}
