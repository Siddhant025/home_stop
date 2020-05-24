import 'package:flutter/material.dart';

const Color White = Colors.white;

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

class Constants {
  static const String NMP = 'New Monthly Plan';
  static const String RV = 'Report Vendor';
  static const String DN = 'Do Nothing';

  static const List<String> choices = [NMP, RV, DN];
}

class itemCard {
  String itemname;
  int price;
  String Description;
  String imgpath;
  int available;
  int selected;
  itemCard({
    this.itemname,
    this.Description,
    this.price,
    this.imgpath,
    this.available,
    this.selected,
  });
}

class item {
  List<itemCard> item_card = [
    itemCard(
      itemname: 'Nivea Cream',
      Description: 'After Shave',
      price: 120,
      imgpath: 'images/Nivea.jpg',
      available: 1,
      selected: 0,
    ),
    itemCard(
        itemname: 'Nivea perfume',
        Description: 'Strong Fragrance',
        price: 165,
        imgpath: 'images/Nivea_perfume.jpg',
        available: 3,
        selected: 0),
    itemCard(
        itemname: 'Vaseline',
        Description: 'Petrolleum jelly',
        price: 60,
        imgpath: 'images/vaseline.jpg',
        available: 2,
        selected: 0),
    itemCard(
        itemname: 'Apple_inc',
        Description: 'watch',
        price: 100000,
        imgpath: 'images/apple_inc.jpg',
        available: 5,
        selected: 0),
    itemCard(
        itemname: 'Addidas',
        Description: 'Shoes',
        price: 4000,
        imgpath: 'images/Addidas_shoes.jpeg',
        available: 7,
        selected: 0),
    itemCard(
        itemname: 'HP',
        Description: 'Laptop',
        price: 64000,
        imgpath: 'images/HP_laptop.webp',
        available: 2,
        selected: 0)
  ];
}
