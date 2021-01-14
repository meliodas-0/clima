import 'package:geolocator/geolocator.dart';import 'package:clima/services/networkService.dart';

import '../constants.dart';


class CurrentLocation {
  static double _latitude, _longitude;

  static Future<void> getLocation() async {
    Position position;
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
    } on Exception catch (e) {
      // TODO
      print(e);
    }

    _latitude = position.latitude ?? double.infinity;
    _longitude = position.longitude ?? double.infinity;

    print(position ?? double.infinity);
  }

  static get longitude => _longitude;

  static double get latitude => _latitude;

  static Future<dynamic> getCurrentLocationData() async {
    await getLocation();
    var jsonData = await NetworkService.getStats(
        'https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=$kApiKey&units=metric');

    return jsonData;
  }
}
