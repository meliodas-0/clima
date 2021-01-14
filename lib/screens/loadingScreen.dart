import 'package:clima/services/currentLocation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';import 'package:clima/screens/weatherMainPage.dart';


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

  void getLocation() async{

    dynamic jsonData = await CurrentLocation.getCurrentLocationData();
    
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
