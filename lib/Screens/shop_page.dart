import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_stop/Screens/payment.dart';
import 'package:home_stop/Screens/review.dart';
import 'package:home_stop/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ShopPage extends StatefulWidget {
  @override
  ShopPage({Key key,this.thumbnail}) : super(key: key);
  final String thumbnail;
  static const String id = 'ShopPage';
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  item ITEM = item();
  ScrollController _scrollBottomBarController =
      new ScrollController(); // set controller on scrolling
  bool isScrollingDown = false;
  bool _show = true;
  double bottomBarHeight = 75; // set bottom bar height
  double _bottomBarOffset = 0;
  int _selectedIndex = 0;
  int _no_of_items = 0;
  int _price = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myScroll();
  }

  @override
  void dispose() {
    _scrollBottomBarController.removeListener(() {});
    super.dispose();
  }

  void showBottomBar() {
    setState(() {
      _show = true;
    });
  }

  void hideBottomBar() {
    setState(() {
      _show = false;
    });
  }

  void myScroll() async {
    _scrollBottomBarController.addListener(() {
      if (_scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          hideBottomBar();
        }
      }
      if (_scrollBottomBarController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          showBottomBar();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 350,
            color: Color(0xFF111328),
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 50,
                  right: 100,
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color: Color(0xFF1D1E33),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 150,
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color: Color(0xFF1D1E33).withOpacity(0.5),
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  child: IconButton(
                    color: Colors.white,
                    alignment: Alignment.topLeft,
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  top: 75,
                  left: 15,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            ),
                            onPressed: null,
                            iconSize: 35,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: const Text(
                              'Stores',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(60),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  image: NetworkImage(widget.thumbnail),
                                  fit: BoxFit.fill),
                            ),
                          ),
                          Text(
                            'Shop Name',
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 75,
                  right: 15,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 80),
                        child: PopupMenuButton<String>(
                          icon: Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          onSelected: choiceAction,
                          itemBuilder: (BuildContext context) {
                            return Constants.choices.map((String choices) {
                              return PopupMenuItem(
                                child: Text(choices),
                                value: choices,
                              );
                            }).toList();
                          },
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Avg Rating',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffffffff),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'N',
                            style: GoogleFonts.montserrat(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffffffff),
                            ),
                          ),
                          SvgPicture.asset(
                            'images/rat_star.svg',
                            width: 45,
                            height: 45,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: 310,
                  left: 15,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        onPressed: null,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.pushNamed(context, ShopPage.id);
                          });
                        },
                        child: Text(
                          'Items',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.pushNamed(context, ReviewPage.id);
                          });
                        },
                        child: Text(
                          'Review',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: Text(
                          'Description',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              controller: _scrollBottomBarController,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: ITEM.item_card.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 100,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: Card(
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Image(
                              image: AssetImage(
                                ITEM.item_card[index].imgpath,
                              ),
                              alignment: Alignment.topLeft,
                            ),
                            height: 100,
                            width: 100,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  ITEM.item_card[index].itemname,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'RobotoCondensed',
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  ITEM.item_card[index].Description,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'RobotoCondensed',
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            height: 100,
                            width: 150,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '${ITEM.item_card[index].price.toString()}Rs',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'RobotoCondensed',
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    RoundIconButton(
                                      w: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      onpress: () {
                                        setState(
                                          () {
                                            if (ITEM.item_card[index]
                                                    .available >
                                                0) {
                                              _no_of_items = _no_of_items + 1;
                                              _price = _price +
                                                  ITEM.item_card[index].price;
                                              ITEM.item_card[index].selected =
                                                  ITEM.item_card[index]
                                                          .selected +
                                                      1;
                                              ITEM.item_card[index].available =
                                                  ITEM.item_card[index]
                                                          .available -
                                                      1;
                                            }
                                          },
                                        );
                                      },
                                    ),
                                    Card(
                                      child: Text(
                                          '${ITEM.item_card[index].selected}'),
                                    ),
                                    RoundIconButton(
                                      w: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                      onpress: () {
                                        setState(
                                          () {
                                            if (ITEM.item_card[index]
                                                        .available >=
                                                    0 &&
                                                ITEM.item_card[index].selected >
                                                    0) {
                                              _no_of_items--;
                                              _price = _price -
                                                  ITEM.item_card[index].price;
                                              ITEM.item_card[index].selected =
                                                  ITEM.item_card[index]
                                                          .selected -
                                                      1;
                                              ITEM.item_card[index].available =
                                                  ITEM.item_card[index]
                                                          .available +
                                                      1;
                                            }
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 80,
            color: Color(0xFF111328),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20, right: 10),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'No of Items',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'RobotoCondensed',
                        ),
                      ),
                      Text(
                        '${_no_of_items}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: 'RobotoCondensed',
                        ),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                ),
                VerticalDivider(
                  thickness: 2,
                  color: Colors.white,
                ),
                Container(
                  height: 60,
                  child: FlatButton(
                      onPressed: () {
                        Alert(
                          context: context,
                          type: AlertType.warning,
                          title: "PAYMENT ALERT",
                          desc: "Which Payment Option would you Proceed With",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Card Payment",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                              onPressed: () => Navigator.pushNamed(context, PaymentPage.id),
                              color: Color.fromRGBO(0, 179, 134, 1.0),
                            ),
                            DialogButton(
                              child: Text(
                                "Cash On Delivery",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                              onPressed: () => Navigator.pop(context),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(116, 116, 191, 1.0),
                                Color.fromRGBO(52, 138, 199, 1.0)
                              ]),
                            )
                          ],
                        ).show();
                      },
                      focusColor: Colors.blueAccent,
                      highlightColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                        side: BorderSide(color: Colors.red),
                      ),
                      splashColor: Colors.blueAccent,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Proceed To',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Checkout',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )),
                ),
                VerticalDivider(
                  thickness: 2,
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Text(
                          'Total Cost(in Rs) ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'RobotoCondensed',
                          ),
                        ),
                      ),
                      Text(
                        '${_price}',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: 'RobotoCondensed',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void choiceAction(String choices) {
    if (choices == Constants.DN) {}
  }
}

class RoundIconButton extends StatelessWidget {
  @override
  RoundIconButton({this.w, this.onpress});
  final Widget w;
  final Function onpress;
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpress,
      child: w,
      elevation: 6,
      constraints: BoxConstraints.tightFor(width: 30, height: 30),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
/*
bottomNavigationBar: Container(
        height: bottomBarHeight,
        width: MediaQuery.of(context).size.width,
        child: _show
            ? BottomNavigationBar(
                backgroundColor: Color(0xFF111328),
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    title: new Text('Items Selected'),
                  ),
                  BottomNavigationBarItem(
                    icon: new Icon(Icons.done),
                    title: new Text('ProceedtoCheckout'),
                  ),
                  BottomNavigationBarItem(
                    icon: new Icon(Icons.attach_money),
                    title: new Text('TotalCost'),
                  ),
                ],
              )
            : Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
              ),
      ),
 */
