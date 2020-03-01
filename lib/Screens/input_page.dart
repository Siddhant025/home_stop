import 'package:flutter/material.dart';
import 'package:home_stop/constants.dart';
import 'sign_up.dart';
import 'log_in.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
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
                      Navigator.push(context,MaterialPageRoute(builder: (context){
                        return LogIn();
                      },),);
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
                        side: BorderSide(color: Colors.red)),
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
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.only(left: 200),
                      child: Text(
                        'or Skip....',
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: Colors.white30,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
