import 'dart:ffi';

import 'package:manektechtask/services/networking.dart';
import 'package:manektechtask/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:manektechtask/services/location.dart';

const apiKey = '07915f51dbc7101a9694014a8e05674c';
const OpenWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';


//this class fetch the weather information

class WeatherModel {


  Future<dynamic> getTypedLocation(String Cityname) async
  {
    var url = '$OpenWeatherMapURL?q=$Cityname&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = new NetworkHelper(url);

    var weatherdata = await networkHelper.getData();
    return weatherdata;


  }


  Future<dynamic> getLocationWeather() async
  {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = new NetworkHelper('$OpenWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherdata = await networkHelper.getData();

    print("weather data is $weatherdata");
    return weatherdata;

  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
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
