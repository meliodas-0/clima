import 'package:clima/screens/weatherMainPage.dart';
import 'package:clima/services/currentLocation.dart';
import 'package:clima/services/networkService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    await CurrentLocation.getLocation();
    var jsonData = await NetworkService.getStats(
        'https://api.openweathermap.org/data/2.5/weather?lat=${CurrentLocation.latitude}&lon=${CurrentLocation.longitude}&appid=$kApiKey&units=metric');

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => WeatherMainPage(
                  jsonData: jsonData,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitDoubleBounce(
        color: Colors.orangeAccent,
        size: 200,
      ),
    );
  }
}
