import 'package:manektechtask/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:manektechtask/services/networking.dart';
import 'package:manektechtask/services/weather.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:manektechtask/services/location.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget
{
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async
  {
    Location location = Location();
    await location.getCurrentLocation();


    NetworkHelper networkHelper = new NetworkHelper('$OpenWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    print(apiKey);


    var weatherData = await networkHelper.getData();
    print(weatherData);
    
    
    Navigator.push(context,
    MaterialPageRoute(
      builder: (context)
          {
            return LocationScreen(locationweather: weatherData,);

          }
    ));




  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: Center(
       child: SpinKitRipple(
         color: Colors.white,
         size: 100.0,

        ),
      )
    );

  }
}
