import 'package:clima/constants.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherMainPage extends StatelessWidget {
  final dynamic jsonData;

  WeatherMainPage({this.jsonData});

  // String time = getTime();
  //
  // String getTime(){
  //
  //   int hour =
  //
  // }

  @override
  Widget build(BuildContext context) {
    String place = jsonData['name']; //'Riga';
    int pressure = jsonData['main']['pressure']; // = 757;
    double windSpeed = jsonData['wind']['speed']; // = 2.5;
    int humidity = jsonData['main']['humidity']; // = 70;
    double t1 = jsonData['main']['temp']; // = 21
    int temp = t1.toInt(); // ;
    DateTime now = DateTime.now();
    int condition = jsonData['weather'][0]['id'];

    return MaterialApp(
      home: Scaffold(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(20, 40, 20, 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Weather in $place',
                            style: kHeaderTextStyle,
                          ),
                          Text(
                            'Now ${now.toString().substring(11, 16)}.',
                            style: kSubHeaderTextStyle,
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: Image.asset(
                                WeatherModel.getWeatherIcon(condition)),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            child: Text(
                              '  $temp°',
                              style: TextStyle(
                                fontSize: 150,
                                fontWeight: FontWeight.bold,
                                color: Color(0xBEFFFFFF),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextIconCombo(
                                  text: '$windSpeed m/s',
                                  icon: WeatherIcons.strong_wind,
                                ),
                                TextIconCombo(
                                  text: '$humidity%',
                                  icon: WeatherIcons.humidity,
                                ),
                                TextIconCombo(
                                    text: '$pressure mmHg',
                                    icon: WeatherIcons.barometer)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextIconCombo extends StatelessWidget {
  final String text;
  final IconData icon;

  TextIconCombo({this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          Icon(
            icon,
            color: kConsColor,
            size: 18,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: kUnderTempTextStyle,
          )
        ],
      ),
    );
  }
}
