import 'package:efarm/Sources/constants.dart';
import 'package:efarm/Sources/CustomBtn.dart';
import 'package:efarm/Sources/CustomInput.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  removePref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var level = preferences.getString("level");
    if (level != null) {
      preferences.remove("level");
    }
  }
 

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Build an alert dialog to display some errors.
  Future<void> alertDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Container(
              child: Text(error),
            ),
            actions: [
              FlatButton(
                child: Text("Close Dialog"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  // Create a new user account
  Future<String> createAccount() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _registerEmail, password: _registerPassword);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  void submitForm() async {
    // Set the form to loading state
    setState(() {
      _registerFormLoading = true;
    });

    // Run the create account method
    String createAccountFeedback = await createAccount();

    // If the string is not null, we got error while create account.
    if (createAccountFeedback != null) {
      alertDialogBuilder(createAccountFeedback);

      // Set the form to regular state [not loading].
      setState(() {
        _registerFormLoading = false;
      });
    } else {
      // The String was null, user is logged in.
      Navigator.pop(context);
    }
  }

  // Default Form Loading State
  bool _registerFormLoading = false;

  // Form Input Field Values
  String _registerEmail = "";
  String _registerPassword = "";

  // Focus Node for input fields
  FocusNode _passwordFocusNode;

  @override
  void initState() {
    removePref();
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 24.0,
                ),
                child: Text(
                  "JOIN US,\nCreate New Account!",
                  textAlign: TextAlign.center,
                  style: Constants.boldHeading,
                ),
              ),
              Expanded(
                  child: Container(
                child: Image.asset("images/Splash/MainSplash.png"),
              )),
              Column(
                children: [
                  CustomInput(
                    hintText: "Email...",
                    onChanged: (value) {
                      _registerEmail = value;
                    },
                    onSubmitted: (value) {
                      _passwordFocusNode.requestFocus();
                    },
                    textInputAction: TextInputAction.next,
                  ),
                  CustomInput(
                    hintText: "Password...",
                    onChanged: (value) {
                      _registerPassword = value;
                    },
                    focusNode: _passwordFocusNode,
                    isPasswordField: true,
                    onSubmitted: (value) {
                      submitForm();
                    },
                  ),
                  CustomBtn(
                    text: "REGISTER NOW",
                    onPressed: () async {
                      submitForm();
                    },
                    isLoading: _registerFormLoading,
                  )
                ],
              ),
              //Facebook & Google Sign in Start

              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            " REGISTER using Google ",
                            style:
                                TextStyle(color: Colors.white, fontSize: 11.5),
                          )
                        ],
                      ),
                      onPressed: () async {
                        await signInWithGoogle();
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Colors.blue[900],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "REGISTER using Facebook",
                            style:
                                TextStyle(color: Colors.white, fontSize: 10.5),
                          )
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                  ),
                ],
              ),
              //Facebook & Google Sign in end
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                ),
                child: CustomBtn(
                  text: "ALREADY HAVE AN ACCOUNT?LOGIN",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  outlineBtn: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
