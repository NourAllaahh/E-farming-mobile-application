import 'package:efarm/DiseasesGuide/DiseasesDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiseasesCard extends StatelessWidget {
  final String diseasestId;
  final Function onPressed;
  final String imageUrl;
  final String title;
  final String target;

  DiseasesCard({this.diseasestId, this.onPressed, this.imageUrl, this.title,this.target});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DiseasesDetails(DiseasesId: diseasestId)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 90,
              height: 90,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                   "$imageUrl",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 16.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
               
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.green[900],
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    target,
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4.0,
                      ),
                      child: Text(
                        "KNOW MORE",
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.red,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
