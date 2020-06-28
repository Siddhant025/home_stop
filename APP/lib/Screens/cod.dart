import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_stop/Screens/shop_page.dart';
import 'package:home_stop/Screens/shopping_store.dart';
import 'package:home_stop/constants.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CashPage extends StatefulWidget {
  CashPage(
      {this.NoofItems,
      this.Totalcash,
      this.name,
      this.email,
      this.thumbnail,
      this.Shopname,
      this.index,
      this.logout,
      this.Phoneno});
  final int Totalcash;
  final int NoofItems;
  final String name;
  final String email;
  final String thumbnail;
  final String Shopname;
  final int index;
  final int Phoneno;
  final bool logout;
  @override
  _CashPageState createState() => _CashPageState();
}

class _CashPageState extends State<CashPage> {
  SelectedList L = new SelectedList();

  Future<bool> _onBackPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShopPage(
          name: widget.Shopname,
          thumbnail: widget.thumbnail,
          Phoneno: widget.Phoneno,
          index: widget.index,
          dashboardname: widget.name,
          logout: widget.logout,
        ),
      ),
    );
    setState(() {
      Provider.of<SelectedList>(context, listen: false).selecteditem.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              'Total Number Of Items Selected : ${widget.NoofItems}',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Total Amount : ${widget.Totalcash}',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Flexible(
              child: Consumer<SelectedList>(
                builder: (context, Selecteddata, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: Selecteddata.selecteditem.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: <Widget>[
                          Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Item : ${Selecteddata.selecteditem[index].name}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Text(
                                  'Selected : ${Selecteddata.selecteditem[index].Selected}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            shadowColor: Colors.black,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Alert(
                  context: context,
                  type: AlertType.success,
                  title: "PAYMENT ALERT",
                  desc:
                      "Your Order will be Dispatched.Thank you for Shopping. ",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "OK",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                      color: Color.fromRGBO(0, 179, 134, 1.0),
                      onPressed: () {
                        setState(() {
                          Provider.of<SelectedList>(context, listen: false)
                              .selecteditem
                              .clear();
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Shopping(
                              name: widget.name,
                              email: widget.email,
                              logout: widget.logout,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ).show();
              },
              child: Container(
                width: 150,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orangeAccent),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "CheckOut",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
