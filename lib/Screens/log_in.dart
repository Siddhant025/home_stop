import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_stop/Screens/shopping_store.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:email_validator/email_validator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class LogIn extends StatefulWidget {
  @override
  static const String id = 'loginpage';
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool islogged = false;
  final usernamecontroller = TextEditingController();
  String email;
  String username;
  String pwd;
  bool _spinner = false;
  final _auth = FirebaseAuth.instance;
  final googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _SignIn() async {
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    final AuthResult authResult = await _auth.signInWithCredential(credential);
    FirebaseUser user = authResult.user;

    print(" signed in " + user.displayName);
    return user;
  }

  void SignOut() {
    googleSignIn.signOut();
    print('User Signed out');
  }

  @override
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
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) => !EmailValidator.validate(value)
                        ? 'Please enter a valid email'
                        : null,
                    autofocus: true,
                    autovalidate: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        fillColor: Colors.white,
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
                            borderSide:
                                BorderSide(color: Colors.blueAccent, width: 1),
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
                    onChanged: (value) {
                      pwd = value;
                    },
                    obscureText: true,
                    validator: (value) {
                      if (value.length < 6) {
                        return 'Password should be of atleast 6 characters.';
                      } else {
                        return null;
                      }
                    },
                    autofocus: true,
                    autovalidate: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        icon: Icon(
                          FontAwesomeIcons.lock,
                        ),
                        isDense: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueAccent, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.black,
                  padding: EdgeInsets.all(8),
                  onPressed: () {
                    setState(() {
                      _spinner = true;
                    });
                    try {
                      final User = _auth.signInWithEmailAndPassword(
                          email: email, password: pwd);
                      try {
                        if (User != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Shopping(
                                  email: email,
                                  name: username,
                                ),
                              ));
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CupertinoAlertDialog(
                                  insetAnimationCurve: Curves.bounceOut,
                                  title: Text("Alert"),
                                  content: Text("Logged in as $email"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("Close"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                );
                              });
                        }
                      } catch (e) {
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "ALERT",
                          desc: "Incorrect Email or Password ",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Yes",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              width: 120,
                            )
                          ],
                        ).show();
                      }
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.red)),
                  highlightElevation: 30,
                  child: Text(
                    'Log In',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        textBaseline: TextBaseline.alphabetic),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  'OR',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Center(
                  child: GoogleSignInButton(
                    darkMode: true,
                    onPressed: () {
                      try {
                        _SignIn().then((FirebaseUser user) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Shopping(
                                        email: user.email,
                                        name: user.displayName,
                                      )));
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CupertinoAlertDialog(
                                  title: Text("Alert"),
                                  content:
                                      Text("Logged in as ${user.displayName}"),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text("Close"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                );
                              });
                        });
                      } catch (e) {
                        print(e.toString());
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  child: Text('LogOut Google Account'),
                  onPressed: () {
                    SignOut();
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Alert"),
                            content: Text("Google Account Logged out"),
                            actions: <Widget>[
                              FlatButton(
                                child: Text("Close"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.redAccent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
