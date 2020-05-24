import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:home_stop/coffee_model.dart';
import 'package:home_stop/Screens/chatscreen.dart';
import 'package:home_stop/Screens/log_in.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Shopping extends StatefulWidget {
  static const String id = 'Shopping';
  //include this
  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping>
    with SingleTickerProviderStateMixin {
  @override
  PageController _pageController;
  int prevPage;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  _coffeeShopList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
        onTap: (){},
        child: Stack(
          children: [
            Center(
              child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 20.0,
                  ),
                  height: 125.0,
                  width: 275.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 10.0,
                        ),
                      ]),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white),
                      child: Row(children: [
                        Container(
                            height: 90.0,
                            width: 85.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10.0),
                                    topLeft: Radius.circular(10.0)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        coffeeShops[index].thumbNail),
                                    fit: BoxFit.cover))),
                        SizedBox(width: 5.0),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                coffeeShops[index].shopName,
                                style: TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                coffeeShops[index].address,
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ])
                      ]))),
            ),
          ],
        ),
      ),
    );
  }

  void getCurrentUser() async {
    try {
      final User = await _auth.currentUser();
      if (User != null) {
        loggedInUser = User;
        print("Logged in as ${loggedInUser.displayName}");
      }
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: debugDefaultTargetPlatformOverride == TargetPlatform.android
            ? 5.0
            : 0.0,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            Container(
              color: Colors.blue,
              child: UserAccountsDrawerHeader(
                accountName: Text(loggedInUser.displayName),
                accountEmail: Text(loggedInUser.email),
                currentAccountPicture: new CircleAvatar(
                  child: Text('S'),
                  backgroundColor: Colors.yellow,
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: new Text('Share the app'),
                leading: Icon(Icons.share),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.edit_attributes),
                title: new Text('Edit Profile'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.chat),
                title: new Text('Chats'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatScreen(
                                loggedInUser: loggedInUser,
                              )));
                },
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(FontAwesomeIcons.shoppingCart),
                title: new Text('My Orders'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.settings),
                title: new Text('Settings'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.calendar_today),
                title: new Text('Set Monthly Plan'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),
            new Divider(
              thickness: 4,
              color: Colors.redAccent,
            ),
            ListTile(
              title: Text('Close'),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
            new Divider(
              thickness: 4,
              color: Colors.redAccent,
            ),
            ListTile(
              title: Text('Log Out'),
              trailing: Icon(FontAwesomeIcons.signOutAlt),
              onTap: () {
                Alert(
                  context: context,
                  type: AlertType.error,
                  title: "ALERT",
                  desc: "Do You Want to Log Out From Your Account",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "Yes",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, LogIn.id);
                        _auth.signOut();
                      },
                      width: 120,
                    )
                  ],
                ).show();
              },
            )
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 15.0,
            child: Container(
                height: 200,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: coffeeShops.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _coffeeShopList(index);
                  },
                ),
                width: MediaQuery.of(context).size.width),
          ),
          Container(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Material(
                        elevation: 30,
                        shadowColor: Colors.black54,
                        child: Card(
                          child: TextField(
                            textAlign: TextAlign.center,
                            onChanged: (value) {},
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              prefixIcon: Icon(Icons.shop),
                              fillColor: Colors.white,
                              hintText: "Enter Shop Name",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*
drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              Container(
                color: Colors.blue,
                child: UserAccountsDrawerHeader(
                  accountName: Text(loggedInUser.displayName),
                  accountEmail: Text(loggedInUser.email),
                  currentAccountPicture: new CircleAvatar(
                    child: Text('S'),
                    backgroundColor: Colors.yellow,
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: new Text('Share the app'),
                  leading: Icon(Icons.share),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.edit_attributes),
                  title: new Text('Edit Profile'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.chat),
                  title: new Text('Chats'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatScreen(
                                  loggedInUser: loggedInUser,
                                )));
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(FontAwesomeIcons.shoppingCart),
                  title: new Text('My Orders'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: new Text('Settings'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.calendar_today),
                  title: new Text('Set Monthly Plan'),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {},
                ),
              ),
              new Divider(
                thickness: 4,
                color: Colors.redAccent,
              ),
              ListTile(
                title: Text('Close'),
                trailing: Icon(Icons.close),
                onTap: () => Navigator.of(context).pop(),
              ),
              new Divider(
                thickness: 4,
                color: Colors.redAccent,
              ),
              ListTile(
                title: Text('Log Out'),
                trailing: Icon(FontAwesomeIcons.signOutAlt),
                onTap: (){
                  Alert(
                    context: context,
                    type: AlertType.error,
                    title: "ALERT",
                    desc: "Do You Want to Log Out From Your Account",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "Yes",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, LogIn.id);
                          _auth.signOut();
                        },
                        width: 120,
                      )
                    ],
                  ).show();
                },
              )
            ],
          ),
        ),
 */
