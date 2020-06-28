import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_stop/Screens/cod.dart';
import 'package:home_stop/Screens/description.dart';
import 'package:home_stop/Screens/payment.dart';
import 'package:home_stop/Screens/review.dart';
import 'package:home_stop/constants.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// ignore: must_be_immutable
class ShopPage extends StatefulWidget {
  @override
<<<<<<< HEAD
  ShopPage({
    Key key,
    this.thumbnail,
    this.index,
    this.name,
    this.Phoneno,
    this.email,
    this.dashboardname,
    this.logout,
  }) : super(key: key);
  final String thumbnail;
  final int index;
  final String name;
  final int Phoneno;
  final String dashboardname;
  final String email;
  final bool logout;
=======
<<<<<<< HEAD
  ShopPage({Key key, this.thumbnail, this.index, this.name}) : super(key: key);
=======
  ShopPage({Key key,this.thumbnail,this.index,this.name}) : super(key: key);
>>>>>>> 182c7f8b5ca1d9f8e0e5d186ff46dc49a0ba1e29
  final String thumbnail;
  final int index;
  final String name;
>>>>>>> 756f0b8b10a869b6236f2c6dd1a1063d307e8ffa
  static const String id = 'ShopPage';
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
<<<<<<< HEAD
  StoreList S = new StoreList();
  SelectedList L = new SelectedList();
=======
<<<<<<< HEAD
  StoreList S = new StoreList();
=======
  StoreList S=new StoreList();
>>>>>>> 182c7f8b5ca1d9f8e0e5d186ff46dc49a0ba1e29
>>>>>>> 756f0b8b10a869b6236f2c6dd1a1063d307e8ffa
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
                            '${widget.name}',
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
                      Text(
                        'Items',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffffffff),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.push(
<<<<<<< HEAD
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReviewPage(
                                  name: widget.name,
                                  thumbnail: widget.thumbnail,
                                ),
                              ),
                            );
=======
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ReviewPage(
                                    name: widget.name,
                                    thumbnail: widget.thumbnail,
                                  ),
                                ));
>>>>>>> 756f0b8b10a869b6236f2c6dd1a1063d307e8ffa
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
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Description(
                                  name: widget.name,
                                  thumbnail: widget.thumbnail,
                                  Phoneno: widget.Phoneno,
                                ),
                              ),
                            );
                          });
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
              itemCount: S.Store_List[widget.index].length,
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
                                S.Store_List[widget.index][index].imgpath,
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
                                  S.Store_List[widget.index][index].itemname,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'RobotoCondensed',
                                      fontSize: 15),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  S.Store_List[widget.index][index].Description,
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
                                  '${S.Store_List[widget.index][index].price.toString()}Rs',
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
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 756f0b8b10a869b6236f2c6dd1a1063d307e8ffa
                                            if (S
                                                    .Store_List[widget.index]
                                                        [index]
                                                    .available >
                                                0) {
                                              _no_of_items = _no_of_items + 1;
                                              _price = _price +
                                                  S
                                                      .Store_List[widget.index]
                                                          [index]
                                                      .price;
                                              S.Store_List[widget.index][index]
                                                  .selected = S
                                                      .Store_List[widget.index]
                                                          [index]
                                                      .selected +
                                                  1;
                                              S.Store_List[widget.index][index]
                                                  .available = S
                                                      .Store_List[widget.index]
                                                          [index]
                                                      .available -
                                                  1;
<<<<<<< HEAD
                                            } else if (S
                                                    .Store_List[widget.index]
                                                        [index]
                                                    .available ==
                                                0) {
                                              final snackbar = SnackBar(
                                                content:
                                                    Text('Item Out of Stock'),
                                                action: SnackBarAction(
                                                    label: 'OK',
                                                    onPressed: () {}),
                                              );
                                              Scaffold.of(context)
                                                  .showSnackBar(snackbar);
=======
=======
                                            if (S.Store_List[widget.index][index].available >
                                                0) {
                                              _no_of_items = _no_of_items + 1;
                                              _price = _price +
                                                  S.Store_List[widget.index][index].price;
                                              S.Store_List[widget.index][index].selected =
                                                  S.Store_List[widget.index][index].selected +
                                                      1;
                                              S.Store_List[widget.index][index].available =
                                                  S.Store_List[widget.index][index].available -
                                                      1;
>>>>>>> 182c7f8b5ca1d9f8e0e5d186ff46dc49a0ba1e29
>>>>>>> 756f0b8b10a869b6236f2c6dd1a1063d307e8ffa
                                            }
                                          },
                                        );
                                      },
                                    ),
                                    Card(
                                      child: Text(
                                          '${S.Store_List[widget.index][index].selected}'),
                                    ),
                                    RoundIconButton(
                                      w: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                      onpress: () {
                                        setState(
                                          () {
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 756f0b8b10a869b6236f2c6dd1a1063d307e8ffa
                                            if (S
                                                        .Store_List[
                                                            widget.index][index]
                                                        .available >=
                                                    0 &&
                                                S
                                                        .Store_List[
                                                            widget.index][index]
                                                        .selected >
<<<<<<< HEAD
                                                    0) {
                                              _no_of_items--;
                                              _price = _price -
                                                  S
                                                      .Store_List[widget.index]
                                                          [index]
                                                      .price;
                                              S.Store_List[widget.index][index]
                                                  .selected = S
                                                      .Store_List[widget.index]
                                                          [index]
                                                      .selected -
                                                  1;
                                              S.Store_List[widget.index][index]
                                                  .available = S
                                                      .Store_List[widget.index]
                                                          [index]
                                                      .available +
                                                  1;
=======
                                                    0) {
                                              _no_of_items--;
                                              _price = _price -
                                                  S
                                                      .Store_List[widget.index]
                                                          [index]
                                                      .price;
                                              S.Store_List[widget.index][index]
                                                  .selected = S
                                                      .Store_List[widget.index]
                                                          [index]
                                                      .selected -
                                                  1;
                                              S.Store_List[widget.index][index]
                                                  .available = S
                                                      .Store_List[widget.index]
                                                          [index]
                                                      .available +
                                                  1;
=======
                                            if (S.Store_List[widget.index][index].available >=
                                                    0 &&
                                                S.Store_List[widget.index][index].selected >
                                                    0) {
                                              _no_of_items--;
                                              _price = _price -
                                                  S.Store_List[widget.index][index].price;
                                              S.Store_List[widget.index][index].selected =
                                                  S.Store_List[widget.index][index].selected -
                                                      1;
                                              S.Store_List[widget.index][index].available =
                                                  S.Store_List[widget.index][index].available +
                                                      1;
>>>>>>> 182c7f8b5ca1d9f8e0e5d186ff46dc49a0ba1e29
>>>>>>> 756f0b8b10a869b6236f2c6dd1a1063d307e8ffa
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
                        setState(() {
                          for (int i = 0;
                              i < S.Store_List[widget.index].length;
                              i++) {
                            if (S.Store_List[widget.index][i].selected > 0) {
                              Provider.of<SelectedList>(context, listen: false)
                                  .additem(
                                name: S.Store_List[widget.index][i].itemname,
                                Selected:
                                    S.Store_List[widget.index][i].selected,
                              );
                            }
                          }
                        });
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
<<<<<<< HEAD
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentPage(
                                            price: _price,
                                            name: widget.dashboardname,
                                            email: widget.email,
                                            thumbnail: widget.thumbnail,
                                            Shopname: widget.name,
                                            index: widget.index,
                                            Phoneno: widget.Phoneno,
                                            logout: widget.logout,
                                          ))),
=======
                              onPressed: () =>
                                  Navigator.pushNamed(context, PaymentPage.id),
>>>>>>> 756f0b8b10a869b6236f2c6dd1a1063d307e8ffa
                              color: Color.fromRGBO(0, 179, 134, 1.0),
                            ),
                            DialogButton(
                              child: Text(
                                "Cash On Delivery",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CashPage(
                                            NoofItems: _no_of_items,
                                            Totalcash: _price,
                                            name: widget.dashboardname,
                                            email: widget.email,
                                            thumbnail: widget.thumbnail,
                                            Shopname: widget.name,
                                            index: widget.index,
                                            Phoneno: widget.Phoneno,
                                            logout: widget.logout,
                                          ))),
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
