import 'package:flutter/material.dart';
import 'package:home_stop/Screens/chatscreen.dart';
import 'package:home_stop/Screens/log_in.dart';
import 'package:home_stop/Screens/payment.dart';
import 'package:home_stop/Screens/shopping_store.dart';
import 'Screens/review.dart';
import 'package:home_stop/Screens/shop_page.dart';
import 'package:home_stop/Screens/sign_up.dart';
import 'Screens/input_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      initialRoute: InputPage.id,
      routes: {
        InputPage.id:(context)=>InputPage(),
        SignUp.id:(context)=>SignUp(),
        LogIn.id:(context)=>LogIn(),
        ShopPage.id:(context)=>ShopPage(),
        ReviewPage.id:(context)=>ReviewPage(),
        PaymentPage.id:(context)=>PaymentPage(),
        Shopping.id:(context)=>Shopping(),
        ChatScreen.id:(context)=>ChatScreen(),
      },
    );
  }
}
