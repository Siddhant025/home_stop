import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:home_stop/Screens/shopping_store.dart';
import 'dart:core';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:email_validator/email_validator.dart';
import 'package:geolocator/geolocator.dart';

class SignUp extends StatefulWidget {
  @override
  static const String id = 'signuppage';
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  String email;
  double Latitude;
  double Longitude;
  String pwd;
  int phoneno;
  String username;
  bool _spinner = false;
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  final emailcontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  final pwdcontroller = TextEditingController();
  final phonenocontroller = TextEditingController();

  void _getCurrentLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    Latitude = position.latitude;
    Longitude = position.longitude;
    print(position);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentLocation();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Align(
            alignment: Alignment.topLeft,
          ),
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: _spinner,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/SP.png'),
            fit: BoxFit.cover,
          )),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Icon(
                      FontAwesomeIcons.userLock,
                      size: 100,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: usernamecontroller,
                      onChanged: (value) {
                        username = value;
                      },
                      validator: (value) {
                        if (value.length < 3) {
                          return 'Please Enter a Valid Username';
                        } else {
                          return null;
                        }
                      },
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                      autovalidate: true,
                      autofocus: true,
                      decoration: InputDecoration(
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          fillColor: Colors.white,
                          icon: Icon(
                            FontAwesomeIcons.user,
                          ),
                          hintText: "USERNAME*",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueAccent, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: pwdcontroller,
                      onChanged: (value) {
                        pwd = value;
                      },
                      validator: (value) {
                        if (value.length < 6) {
                          return 'Password should be of atleast 6 characters.';
                        } else {
                          return null;
                        }
                      },
                      obscureText: true,
                      autovalidate: true,
                      autofocus: true,
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          fillColor: Colors.white,
                          icon: Icon(
                            FontAwesomeIcons.lock,
                          ),
                          hintText: "PASSWORD*",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueAccent, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)))),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: emailcontroller,
                      onChanged: (value) {
                        email = value;
                      },
                      autofocus: true,
                      autovalidate: true,
                      validator: (value) => !EmailValidator.validate(value)
                          ? 'Please enter a valid email'
                          : null,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          icon: Icon(
                            FontAwesomeIcons.voicemail,
                          ),
                          hintText: "EMAIL*",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide.none),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueAccent, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blueAccent, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)))),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: phonenocontroller,
                      onChanged: (value) {
                        phoneno = int.parse(value);
                      },
                      validator: (value) {
                        if (value.length != 10) {
                          return 'Please Enter a Valid Phone Number';
                        } else {
                          return null;
                        }
                      },
                      autofocus: true,
                      autovalidate: true,
                      keyboardType: TextInputType.phone,
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        icon: Icon(
                          FontAwesomeIcons.phone,
                        ),
                        hintText: "PHONE NUMBER*",
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide: BorderSide.none),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    textColor: Colors.white,
                    color: Colors.black,
                    padding: EdgeInsets.all(8),
                    onPressed: () async {
                      setState(() {
                        _spinner = true;
                      });
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: pwd);
                        if (email == null ||
                            pwd == null ||
                            phoneno == null ||
                            username == null) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CupertinoAlertDialog(
                                  insetAnimationCurve: Curves.decelerate,
                                  title: Text("Error"),
                                  content: Text("All Field Are Not Filled"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("Close"),
                                      onPressed: () {
                                        usernamecontroller.clear();
                                        pwdcontroller.clear();
                                        phonenocontroller.clear();
                                        emailcontroller.clear();
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              });
                        } else if (newUser != null) {
                          _spinner = false;
                          _firestore.collection('users').add({
                            'email': email,
                            'password': pwd,
                            'phoneno': phoneno,
                            'username': username,
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Shopping(
                                email: email,
                                name: username,
                                Latitude: Latitude,
                                Longitude: Longitude,
                              ),
                            ),
                          );
                        }
                      } catch (e) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CupertinoAlertDialog(
                                insetAnimationCurve: Curves.decelerate,
                                title: Text("Error"),
                                content: Text("All Field Are Not Filled"),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text("Close"),
                                    onPressed: () {
                                      usernamecontroller.clear();
                                      pwdcontroller.clear();
                                      phonenocontroller.clear();
                                      emailcontroller.clear();
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              );
                            });
                        print(e.toString());
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.red)),
                    highlightElevation: 30,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontStyle: FontStyle.italic,
                          textBaseline: TextBaseline.alphabetic),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
