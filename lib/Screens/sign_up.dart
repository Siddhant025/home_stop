import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/SP.png'),
            fit: BoxFit.cover,
          )
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 50.0,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('images/Login Photo.jpeg'),
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.purpleAccent),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.only(left:20,right: 20 ),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(
                        FontAwesomeIcons.user,
                      ),
                      hintText: "USERNAME",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide.none
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.only(left:20,right: 20 ),
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(
                        FontAwesomeIcons.lock,
                      ),
                      hintText: "PASSWORD",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide.none
                      ),
                    ),
                  ),
                ),
                SizedBox(height:10 ),
                Padding(
                  padding: EdgeInsets.only(left:20,right: 20 ),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(
                        FontAwesomeIcons.voicemail,
                      ),
                      hintText: "EMAIL",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide.none
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.only(left:20,right: 20 ),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(
                        FontAwesomeIcons.phone,
                      ),
                      hintText: "PHONE NUMBER",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide.none
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100,),
                RaisedButton(
                  textColor: Colors.white,
                  color:Colors.black,
                  padding: EdgeInsets.all(8),
                  onPressed: () {},
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
