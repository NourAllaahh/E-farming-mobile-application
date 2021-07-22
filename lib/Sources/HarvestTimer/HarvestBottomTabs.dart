import 'package:flutter/material.dart';

class HarvestBottomTabs extends StatefulWidget {
  
  final int selectedTabs; // to identify selected tabs with pages
  final Function(int) tabpressed; // to change page when tab is selected
  HarvestBottomTabs({this.selectedTabs, this.tabpressed});
  @override
  _HarvestBottomTabsState createState() => _HarvestBottomTabsState();
}

class _HarvestBottomTabsState extends State<HarvestBottomTabs> {
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
            HarvestBottombtn(
              imagePath: 'images/Logos/PlantDiseasesLogos/DiseasesGuide.png',
              selected: selectedTab == 0 ? true : false,
              onPressed: () {
                setState(() {
                  widget.tabpressed(0);
                });
              },
            ),
            HarvestBottombtn(
              imagePath: "images/HarvestTimer/TimerLogo.png",
              selected: selectedTab == 1 ? true : false,
              onPressed: () {
                setState(() {
                  widget.tabpressed(1);
                });
              },
            ),
            HarvestBottombtn(
              imagePath: "images/HarvestTimer/CreateLogo.png",
              selected: selectedTab == 2 ? true : false,
              onPressed: () {
                setState(() {
                  widget.tabpressed(2);
                });
              },
            ),
            
            
          ],
        ));
  }
}

class HarvestBottombtn extends StatelessWidget {
  final String imagePath;
  final bool selected;
  final Function onPressed;
  HarvestBottombtn({this.imagePath, this.selected, this.onPressed});
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
