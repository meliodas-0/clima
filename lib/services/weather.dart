class WeatherModel {
  static String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'images/thunderstorm.png';
    } else if (condition < 400) {
      return 'images/drizzle.png';
    } else if (condition < 600) {
      return 'images/rain.png';
    } else if (condition < 700) {
      return 'images/snow.png';
    } else if (condition < 800) {
      return 'images/atmosphere.png';
    } else if (condition == 800) {
      return 'images/sunny.png';
    } else {
      return 'images/cloud.png';
    }
  }

  static String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
