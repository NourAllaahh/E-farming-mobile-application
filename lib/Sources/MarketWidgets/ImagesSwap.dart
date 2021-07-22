import 'package:flutter/material.dart';

class ImagesSwap extends StatefulWidget {
  final List imageList;
  ImagesSwap({this.imageList});

  @override
  _ImagesSwapState createState() => _ImagesSwapState();
}

class _ImagesSwapState extends State<ImagesSwap> {
  int _selectedImage =0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      child: Stack(
        children: [
          PageView(
            onPageChanged: (num){
              setState(() {
                           _selectedImage =num;   
                            });
            },
            children: [
              for (var i = 0; i < widget.imageList.length; i++)
                Container(
                  child: Image.network(
                    "${widget.imageList[i]}",
                    fit: BoxFit.fill,
                  ),
                )
            ],
          ),
          Positioned(
            bottom: 20.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < widget.imageList.length; i++)
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    width: _selectedImage==i?35.0:10.0,
                    height: 15.0,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12.0)
                  ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
