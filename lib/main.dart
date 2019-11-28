import 'package:fantasybball_tools/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          textSelectionColor: Colors.black, brightness: Brightness.dark),
      home: HomeScreen(),
    );
  }
}
