import 'package:clima/constants.dart';
import 'package:clima/screens/cityScreen.dart';
import 'package:clima/services/currentLocation.dart';
import 'package:clima/services/networkService.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherMainPage extends StatefulWidget {
  final dynamic jsonData;

  WeatherMainPage({this.jsonData});

  @override
  _WeatherMainPageState createState() => _WeatherMainPageState();
}

class _WeatherMainPageState extends State<WeatherMainPage> {
  var cityName;
  String place;
  int pressure;
  double windSpeed;
  int humidity;
  int temp;
  DateTime now = DateTime.now();
  int condition;

  void updateUI(dynamic jsonData) {
    setState(() {
      if (jsonData == null) {
        place = 'Search another place';
        pressure = 0;
        windSpeed = 0;
        humidity = 0;
        temp = 0;
        now = DateTime.now();
        condition = 0;

        return;
      }

      place = jsonData['name']; //'Riga';
      place = 'Weather in $place';
      pressure = jsonData['main']['pressure']; // = 757;
      windSpeed = jsonData['wind']['speed']; // = 2.5;
      humidity = jsonData['main']['humidity']; // = 70;
      var t1 = jsonData['main']['temp']; // = 21
      temp = t1.toInt(); // ;
      now = DateTime.now();
      condition = jsonData['weather'][0]['id'];
      print(jsonData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Hind'),
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
                            place,
                            style: kHeaderTextStyle,
                          ),
                          Text(
                            'At ${now.toString().substring(11, 16)}.',
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
                        Center(
                          child: Container(
                            child: Text(
                              ' $temp°',
                              style: TextStyle(
                                fontSize: 150,
                                fontWeight: FontWeight.bold,
                                color: Color(0xBEFFFFFF),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              children: [
                                Row(
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
                                      text: '$pressure Pa',
                                      icon: WeatherIcons.barometer,
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: FlatButton(
                                            onPressed: () async {
                                              dynamic weatherData =
                                                  await CurrentLocation
                                                      .getCurrentLocationData();
                                              updateUI(weatherData);
                                            },
                                            child: Icon(
                                              Icons.near_me,
                                              color: kConsColor,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: FlatButton(
                                            onPressed: () async {
                                              cityName = await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CityPage()));

                                              print(cityName);

                                              if (cityName != null) {
                                                getCityWeather();
                                              }
                                            },
                                            child: Icon(
                                              Icons.location_city,
                                              color: kConsColor,
                                              size: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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

  @override
  void initState() {
    super.initState();
    updateUI(widget.jsonData);
  }

  void getCityWeather() async {
    var data = await NetworkService.getStats(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$kApiKey&units=metric');

    updateUI(data);
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
