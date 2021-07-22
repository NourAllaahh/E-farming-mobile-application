
import 'package:efarm/AuthPages/loginpage.dart';
import 'package:efarm/Firebase%20Services/FirebaseServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key key}) : super(key: key);

  @override
  MyDrawerState createState() => MyDrawerState();
}

class MyDrawerState extends State<MyDrawer> {
  FirebaseServices _firebaseServices = FirebaseServices();

  var username;
  var email;
  bool isSignIn = false;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    username = preferences.getString("username");
    email = preferences.getString("email");

    if (username != null) {
      setState(() {
        username = preferences.getString("username");
        email = preferences.getString("email");
        isSignIn = true;
      });
    }
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(FirebaseAuth.instance.currentUser.displayName),
            accountEmail: Text(FirebaseAuth.instance.currentUser.email),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
              backgroundColor: Colors.white,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://i.pinimg.com/originals/4f/95/88/4f9588f42bb88f5cbbd3e12c8ef57786.jpg"),
                  fit: BoxFit.cover),
              color: Colors.green,
            ),
          ),
          ListTile(
            title: Text("Home"),
            leading: Icon(Icons.home, color: Colors.green[700]),
            onTap: () {
              Navigator.of(context).pushNamed('HomePage');
            },
          ),
                 ListTile(
            title: Text("For You"),
            leading: Icon(Icons.folder_special, color: Colors.green[700]),
            onTap: () {
              Navigator.of(context).pushNamed('FarmerGuide');
            },
          ),
          ListTile(
            title: Text("Your Crops"),
            leading: Icon(Icons.star, color: Colors.green[700]),
            onTap: () {
              Navigator.of(context).pushNamed('InterstedList');
            },
          ),
          ListTile(
            title: Text("Notifications"),
            leading: Icon(Icons.notifications, color: Colors.green[700]),
            onTap: () {},
          ),
          ListTile(
            title: Text("Plant Scanner"),
            leading: Icon(Icons.photo_camera, color: Colors.green[700]),
            onTap: () {
              Navigator.of(context).pushNamed('PDDSplash');
            },
          ),
                 ListTile(
            title: Text("Soil Picker"),
            leading: Icon(Icons.photo_camera, color: Colors.green[700]),
            onTap: () {
              Navigator.of(context).pushNamed('PDDSplash');
            },
          ),
   
          ListTile(
            title: Text("Get Help"),
            leading: Icon(Icons.phone, color: Colors.green[700]),
            onTap: () {
              Navigator.of(context).pushNamed('Contact');
            },
          ),
          ListTile(
            title: Text("Feedback"),
            onTap: () {
              Navigator.of(context).pushNamed('Feedback');

            },
          ),
          ListTile(
            title: Text("About Us"),
            onTap: () {
              Navigator.of(context).pushNamed('About');
            },
          ),
          ListTile(
              title: Text("Logout",style: TextStyle(color: Colors.red),),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              })
        ],
      ),
    );
  }
}

//class MyDrawer extends StatelessWidget {
// var username;
//var email;
// @override
//Widget build(BuildContext context) {

//}
//}
