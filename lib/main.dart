import 'package:clima/constants.dart';
import 'package:clima/screens/loadingScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Hind'),
      home: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SafeArea(
          child: LoadingScreen(),
        ),
      ),
    );
  }
}
