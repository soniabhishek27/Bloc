import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:manektechtask/utilities/constants.dart';
import 'package:http/http.dart';
import 'package:manektechtask/services/weather.dart';
import 'package:manektechtask/services/weather.dart';
import 'city_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


var weatherData;

class LocationScreen extends StatefulWidget
{

  LocationScreen({this.locationweather});

  final locationweather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}


class _LocationScreenState extends State<LocationScreen>
{
  WeatherModel weather = new WeatherModel();

  int temperature;
  String weatherIcon;
  String weatherMessage;
  String cityName;

  void myInit()async
  {
    weatherData = await weather.getLocationWeather();
    updateUI(weatherData);
  }

  @override
  void initState()
  {
    super.initState();

    // updateUI(widget.locationweather);
    myInit();
  }

  void updateUI(dynamic weatherData)
  {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        return;
      }

      var temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      //get message
      weatherMessage = weather.getMessage(temperature);
      cityName = weatherData['name'];
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: weatherData == null ? Center(
        child: SpinKitRipple(
          color: Colors.white,
          size: 100.0,

        ),
      ) : Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/grass.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        // constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async{
                      var TypedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      if (TypedName != null)
                        {
                          var typedWeaterData = await weather.getTypedLocation(TypedName);
                          updateUI(typedWeaterData);
                        }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: AutoSizeText(
                  '$weatherMessage in $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {

    weatherData = null;
    super.dispose();
  }

}
