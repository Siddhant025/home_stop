import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_stop/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Description extends StatefulWidget {
  @override
  static const String id = 'DescriptionPage';
  Description({this.name, this.thumbnail, this.Phoneno});
  final String name;
  final String thumbnail;
  final int Phoneno;
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  Firestore _firestore = Firestore.instance;
  @override
  Future<void> _makePhoneCall() async {
    String Phone = 'tel:' + widget.Phoneno.toString();
    launch(Phone);
  }

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
                            return Constants.choices.map(
                              (String choices) {
                                return PopupMenuItem(
                                  child: Text(choices),
                                  value: choices,
                                );
                              },
                            ).toList();
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
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            color: Colors.green[900],
            elevation: 10,
            padding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.black),
            ),
            onPressed: () {
              setState(() {
                _makePhoneCall();
              });
            },
            child: Icon(
              Icons.call,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Flexible(
              child: Column(
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                stream: (widget.name == 'Mahalaxmi Provision')
                    ? _firestore.collection('reviewMP').snapshots()
                    : (widget.name == 'Parishram Electrics')
                        ? _firestore.collection('reviewPE').snapshots()
                        : (widget.name == 'Samsung Showroom')
                            ? _firestore.collection('reviewSS').snapshots()
                            : (widget.name == 'Apex Dry Fruit Stores')
                                ? _firestore.collection('reviewAD').snapshots()
                                : _firestore.collection('reviewKS').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.blueAccent,
                      ),
                    );
                  }
                  final review = snapshot.data.documents;
                  List<ReviewCard> reviewcards = [];
                  for (var r in review) {
                    final Review = r.data['review'];
                    int rating = r.data['slider'];
                    final reviewcard = ReviewCard(
                      review: Review,
                      rating: rating,
                    );
                    reviewcards.add(reviewcard);
                  }
                  return Expanded(
                    child: ListView(
                      reverse: false,
                      children: reviewcards,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    ),
                  );
                },
              )
            ],
          ))
        ],
      ),
    );
  }

  void choiceAction(String choices) {
    if (choices == Constants.DN) {}
  }
}

class ReviewCard extends StatelessWidget {
  final String review;
  final int rating;
  ReviewCard({this.review, this.rating});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(7),
        child: Stack(
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Align(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                        ),
                        Text(
                          'REVIEW : $review',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'RATING : ',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              height: 60,
                              width: 250,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 20,
                                    child: Icon(
                                      FontAwesomeIcons.solidStar,
                                      color: Colors.yellow,
                                      size: 40,
                                    ),
                                  );
                                },
                                itemCount: rating,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
