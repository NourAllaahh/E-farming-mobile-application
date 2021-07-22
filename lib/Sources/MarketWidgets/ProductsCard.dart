import 'package:efarm/AgroMarket/ProductDetails/ProductDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsCard extends StatelessWidget {
  final String productId;
  final Function onPressed;
  final String imageUrl;
  final String title;
  final String price;

  ProductsCard(
      {this.productId, this.onPressed, this.imageUrl, this.price, this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetails(ProductId: productId)));
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.0)),
        height: 350.0,
        margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        child: Stack(
          children: [
            Container(
              height: 350,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  "$imageUrl",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w600)),
                    Text(price,
                        style: TextStyle(
                            fontSize: 19.0,
                            color: Colors.red,
                            fontWeight: FontWeight.w600))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
