import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_stop/constants.dart';
import 'sign_up.dart';
import 'log_in.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class InputPage extends StatefulWidget {
  @override
  static const String id = 'inputpage';
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  int _selectedindex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 70),
                  child: Text(
                    'Welcome',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: White,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: Text(
                    'hjdsgfjhdshjdsgdsghdsgdskcdschdsghdshcdgshjc',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: White),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: Text(
                    'Please Proceed to login or sign up or skip to continue',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: White),
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
                RaisedButton(
                  padding: EdgeInsets.all(10),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LogIn();
                        },
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                      side: BorderSide(color: Colors.red)),
                  highlightElevation: 30,
                  highlightColor: Colors.black,
                  child: Text(
                    'Log In',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        textBaseline: TextBaseline.alphabetic),
                  ),
                  color: Colors.white,
                ),
                SizedBox(
                  height: 40,
                ),
                RaisedButton(
                  padding: EdgeInsets.all(10),
                  highlightColor: Colors.black,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUp();
                        },
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                    side: BorderSide(color: Colors.red),
                  ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        textBaseline: TextBaseline.alphabetic),
                  ),
                  color: Colors.white,
                ),
                SizedBox(
                  height: 160,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SnakeNavigationBar(
        backgroundColor: Colors.yellowAccent,
        selectedIconColor: Colors.red,
        style: SnakeBarStyle.floating,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.amazon), title: Text('Amazon')),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.music), title: Text('Music'))
        ],
        currentIndex: _selectedindex,
        onPositionChanged: (index) => setState(() => _selectedindex = index),
        elevation: 30,
      ),
    );
  }
}
