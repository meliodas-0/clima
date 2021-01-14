import 'package:flutter/material.dart';

import '../constants.dart';

class CityPage extends StatefulWidget {
  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  String cityName;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Hind'),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            elevation: 1,
            centerTitle: true,
            title: Text(
              'Clima',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          backgroundColor: kPrimaryColor,
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: FractionalOffset.topLeft,
                        end: FractionalOffset.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.0),
                          kSecondaryColor,
                        ],
                        stops: [
                          0.2,
                          0.8
                        ]),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      child: TextField(
                        decoration: kTextFieldInputDecoration,
                        onChanged: (value) => {cityName = value},
                      ),
                      margin: EdgeInsets.all(20),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context, cityName);
                      },
                      child: Text('Get Weather'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
