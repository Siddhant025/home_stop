import 'package:flutter/material.dart';
import 'package:home_stop/Screens/sign_up.dart';
import 'input_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      home:InputPage(),
    );
  }
}
