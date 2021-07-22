import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

void main() => runApp(Contact());

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: 60),
          child: ContactUs(
            cardColor: Colors.white,
            textColor: Colors.black87,
            email: 'EFarming@gmail.com',
            companyName: 'E-Farming',
            companyColor: Colors.black87,
            phoneNumber: '0123456789',
            website: 'https://WWW.E-Farming.com',
            tagLine: 'Mobile Application',
            taglineColor: Colors.black54,
            twitterHandle: 'E-Farming',
            instagram: 'E-Farming',
          ),
        ),
      ),
    );
  }
}
