import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_stop/Screens/shop_page.dart';
import 'package:home_stop/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReviewPage extends StatefulWidget {
  @override
  static const String id = 'ReviewPage';
  ReviewPage({this.name, this.thumbnail});
  final String name;
  final String thumbnail;
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  var myFeedbackText = "COULD BE BETTER";
  var sliderValue = 0.0;
  IconData myFeedback1 = FontAwesomeIcons.star,
      myFeedback2 = FontAwesomeIcons.star,
      myFeedback3 = FontAwesomeIcons.star,
      myFeedback4 = FontAwesomeIcons.star,
      myFeedback5 = FontAwesomeIcons.star;
  Color myFeedbackColor1 = Colors.grey,
      myFeedbackColor2 = Colors.grey,
      myFeedbackColor3 = Colors.grey,
      myFeedbackColor4 = Colors.grey,
      myFeedbackColor5 = Colors.grey;
  String Review;
  final RC = TextEditingController();
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
                            Navigator.pop(context);
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
                          setState(() {});
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
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(20),
            height: 150,
            child: Material(
              elevation: 30,
              shadowColor: Colors.black54,
              child: Card(
                child: TextField(
                    textAlign: TextAlign.center,
                    controller: RC,
                    onChanged: (value) {
                      Review = value;
                    },
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.rate_review),
                      fillColor: Colors.white,
                      hintText: "Write Your Review",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide.none),
                    )),
              ),
            ),
          ),
          Flexible(
            child: Container(
              color: Color(0xffE5E5E5),
              child: Column(
                children: <Widget>[
                  Container(
                    child: Container(
                        child: Text(
                      "1. On a scale of 1 to 5, how do you rate our service?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    child: Align(
                      child: Material(
                        color: Colors.white,
                        elevation: 14.0,
                        borderRadius: BorderRadius.circular(10.0),
                        shadowColor: Color(0x802196F3),
                        child: Container(
                            width: 350.0,
                            height: 300.0,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: StarWidget(),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Slider(
                                      min: 0.0,
                                      max: 5.0,
                                      divisions: 5,
                                      value: sliderValue,
                                      activeColor: Color(0xffed1e79),
                                      inactiveColor: Colors.blueGrey,
                                      onChanged: (newValue) {
                                        setState(() {
                                          sliderValue = newValue;
                                          if (sliderValue == 1.0) {
                                            myFeedback1 =
                                                FontAwesomeIcons.solidStar;
                                            myFeedbackColor1 = Colors.yellow;
                                          } else if (sliderValue < 1.0) {
                                            myFeedback1 = FontAwesomeIcons.star;
                                            myFeedbackColor1 = Colors.grey;
                                          }
                                          if (sliderValue == 2.0) {
                                            myFeedback2 =
                                                FontAwesomeIcons.solidStar;
                                            myFeedbackColor2 = Colors.yellow;
                                          } else if (sliderValue < 2.0) {
                                            myFeedback2 = FontAwesomeIcons.star;
                                            myFeedbackColor2 = Colors.grey;
                                          }
                                          if (sliderValue == 3.0) {
                                            myFeedback3 =
                                                FontAwesomeIcons.solidStar;
                                            myFeedbackColor3 = Colors.yellow;
                                          } else if (sliderValue < 3.0) {
                                            myFeedback3 = FontAwesomeIcons.star;
                                            myFeedbackColor3 = Colors.grey;
                                          }
                                          if (sliderValue == 4.0) {
                                            myFeedback4 =
                                                FontAwesomeIcons.solidStar;
                                            myFeedbackColor4 = Colors.yellow;
                                          } else if (sliderValue < 4.0) {
                                            myFeedback4 = FontAwesomeIcons.star;
                                            myFeedbackColor4 = Colors.grey;
                                          }
                                          if (sliderValue == 5.0) {
                                            myFeedback5 =
                                                FontAwesomeIcons.solidStar;
                                            myFeedbackColor5 = Colors.yellow;
                                          } else if (sliderValue < 5.0) {
                                            myFeedback5 = FontAwesomeIcons.star;
                                            myFeedbackColor5 = Colors.grey;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                      child: Text(
                                    "Your Rating : $sliderValue",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(10.0)),
                                      color: Color(0xffed1e79),
                                      child: Text(
                                        'Submit',
                                        style:
                                            TextStyle(color: Color(0xffffffff)),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          RC.clear();
                                        });
                                      },
                                    ),
                                  )),
                                ),
                              ],
                            )),
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

  void choiceAction(String choices) {
    if (choices == Constants.DN) {}
  }

  List<Widget> StarWidget() {
    List<Widget> myContainer = new List();
    myContainer.add(Container(
        child: Icon(
      myFeedback1,
      color: myFeedbackColor1,
      size: 20.0,
    )));
    myContainer.add(Container(
        child: Icon(
      myFeedback2,
      color: myFeedbackColor2,
      size: 20.0,
    )));
    myContainer.add(Container(
        child: Icon(
      myFeedback3,
      color: myFeedbackColor3,
      size: 20.0,
    )));
    myContainer.add(Container(
        child: Icon(
      myFeedback4,
      color: myFeedbackColor4,
      size: 20.0,
    )));
    myContainer.add(Container(
        child: Icon(
      myFeedback5,
      color: myFeedbackColor5,
      size: 20.0,
    )));
    return myContainer;
  }
}
