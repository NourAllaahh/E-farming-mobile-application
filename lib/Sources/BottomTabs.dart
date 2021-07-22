import 'package:flutter/material.dart';

class BottomTabs extends StatefulWidget {
  
  final int selectedTabs; // to identify selected tabs with pages
  final Function(int) tabpressed; // to change page when tab is selected
  BottomTabs({this.selectedTabs, this.tabpressed});
  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
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
            BottomTabsBtn(
              imagePath: "images/Logos/MarketLogos/Market.png",
              selected: selectedTab == 0 ? true : false,
              onPressed: () {
                setState(() {
                  widget.tabpressed(0);
                });
              },
            ),
            BottomTabsBtn(
              imagePath: "images/Logos/MarketLogos/search.png",
              selected: selectedTab == 1 ? true : false,
              onPressed: () {
                setState(() {
                  widget.tabpressed(1);
                });
              },
            ),
            BottomTabsBtn(
              imagePath: "images/Logos/MarketLogos/favourite.png",
              selected: selectedTab == 2 ? true : false,
              onPressed: () {
                setState(() {
                  widget.tabpressed(2);
                });
              },
            ),
            
            BottomTabsBtn(
              imagePath: "images/Logos/Logout.png",
              selected: selectedTab == 3 ? true : false,
              onPressed: () {
                setState(() {
                
                  
                });
              },
            ),
          ],
        ));
  }
}

class BottomTabsBtn extends StatelessWidget {
  final String imagePath;
  final bool selected;
  final Function onPressed;
  BottomTabsBtn({this.imagePath, this.selected, this.onPressed});
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
