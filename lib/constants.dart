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
  List<itemCard> item_card1 = [
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

  List<itemCard> item_card2 = [
    itemCard(
      itemname: 'Sony TV',
      Description: 'See the future',
      price: 43990,
      imgpath: 'images/SonyTV.jpg',
      available: 3,
      selected: 0,
    ),
    itemCard(
        itemname: 'OnePlus Earpiece',
        Description: 'Live The Music',
        price: 2999,
        imgpath: 'images/1+earphone.jpg',
        available: 10,
        selected: 0),
    itemCard(
        itemname: 'Panasonic Fridge',
        Description: 'Best in Buisness',
        price: 71450,
        imgpath: 'images/SonyFridge.jpeg',
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
        itemname: 'LG AC',
        Description: 'Air Conditioning',
        price: 46400,
        imgpath: 'images/LGAC.jpeg',
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

  List<itemCard> item_card3 = [
    itemCard(
      itemname: 'Samsung TV',
      Description: 'See the future',
      price: 15000,
      imgpath: 'images/SAMTV.jpeg',
      available: 5,
      selected: 0,
    ),
    itemCard(
        itemname: 'Samsung Washmachine',
        Description: '',
        price: 13100,
        imgpath: 'images/SAMWASH.jpeg',
        available: 15,
        selected: 0),
    itemCard(
        itemname: 'Samsung Microwave',
        Description: '',
        price: 5750,
        imgpath: 'images/SAMMICRO.jpeg',
        available: 4,
        selected: 0),
    itemCard(
        itemname: 'Samsung M31',
        Description: 'Phone',
        price: 17950,
        imgpath: 'images/SAMM31.webp',
        available: 5,
        selected: 0),
    itemCard(
        itemname: 'Samsung S20',
        Description: 'Phone',
        price: 46400,
        imgpath: 'images/SAMS20.webp',
        available: 7,
        selected: 0),
    itemCard(
        itemname: 'Samsung Notebook 9',
        Description: 'Laptop',
        price: 120000,
        imgpath: 'images/SAMLAP.jpg',
        available: 6,
        selected: 0),
    itemCard(
      itemname: 'Samsung AC',
      Description: '',
      price: 35990,
      imgpath: 'SAMAC.webp',
      available: 8,
      selected: 0
    ),
  ];

  List<itemCard> item_card4 = [
    itemCard(
      itemname: 'Almonds',
      Description: '',
      price: 600,
      imgpath: 'images/ALMOND.jpg',
      available: 6,
      selected: 0,
    ),
    itemCard(
        itemname: 'Cashews',
        Description: '',
        price: 499,
        imgpath: 'images/Cashews.jpg',
        available: 10,
        selected: 0),
    itemCard(
        itemname: 'CornNuts',
        Description: '',
        price: 149,
        imgpath: 'images/CornNuts.jpg',
        available: 2,
        selected: 0),
    itemCard(
        itemname: 'Hazelnuts',
        Description: '',
        price: 720,
        imgpath: 'images/Hazelnuts.jpg',
        available: 5,
        selected: 0),
    itemCard(
        itemname: 'walnuts',
        Description: '',
        price: 290,
        imgpath: 'images/Walnuts.jpg',
        available: 20,
        selected: 0),
    itemCard(
        itemname: 'Peanuts',
        Description: '',
        price: 85,
        imgpath: 'images/Peanuts.jpg',
        available: 15,
        selected: 0)
  ];

  List<itemCard> item_card5 = [
    itemCard(
      itemname: 'Pilot V7',
      Description: '',
      price: 65,
      imgpath: 'images/PILOTV7.jpg',
      available: 15,
      selected: 0,
    ),
    itemCard(
        itemname: 'Polaroid 9 Set',
        Description: '',
        price: 50,
        imgpath: 'images/Polaroid9Colour.jpg',
        available: 10,
        selected: 0),
    itemCard(
        itemname: 'Scissors',
        Description: '',
        price: 100,
        imgpath: 'images/Scissors.jpg',
        available: 2,
        selected: 0),
    itemCard(
        itemname: 'Classmate Notebooks',
        Description: '',
        price: 120,
        imgpath: 'images/ClassmateNotebooks.jpg',
        available: 7,
        selected: 0),
    itemCard(
        itemname: 'Coloured Tapes',
        Description: '',
        price: 150,
        imgpath: 'images/Tapes.jpg',
        available: 20,
        selected: 0),
    itemCard(
        itemname: 'Glue Gun',
        Description: '',
        price: 500,
        imgpath: 'images/GlueGun.jpg',
        available: 15,
        selected: 0),
    itemCard(
        itemname: 'Whitner',
        Description: '',
        price: 50,
        imgpath: 'images/Whitner.jpg',
        available: 12,
        selected: 0),
    itemCard(
        itemname: 'Glue',
        Description: '',
        price: 60,
        imgpath: 'images/Glue.jpg',
        available: 9,
        selected: 0),
  ];

}
class StoreList{
  List<List<itemCard>> Store_List=[
    item().item_card1,
    item().item_card2,
    item().item_card3,
    item().item_card4,
    item().item_card5,
  ];
}

class Selecteditem{
  String name;
  int Selected;
  Selecteditem({this.name,this.Selected});
}

class SelectedList extends ChangeNotifier{
  List<Selecteditem> selecteditem=[];

  void additem({String name,int Selected }){
    final I=Selecteditem(name: name,Selected: Selected);
    selecteditem.add(I);
    notifyListeners();
  }
}
