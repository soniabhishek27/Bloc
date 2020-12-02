// these things should be followed in every Block Pattern
// List of Data
// Stream controllers
// Stream Sink Getter
// Constructor - add data, listen to changes
//Core functions
// dispose

import 'dart:async';
import 'package:manektechtask/models/weatherInfo.dart';
import 'package:manektechtask/services/weather.dart';

List<WeatherInfo> weatherList = [];

enum weatherAction
{
 Fetch,
 Delete,
}

class Bloc
{


 WeatherModel weatherModel = WeatherModel();

 // final _stateStreamController = StreamController<List<WeatherInfo>>();
 final _stateStreamController = StreamController<dynamic>();

 //for input
 StreamSink<dynamic> get _weatherSink => _stateStreamController.sink;
 //for output
 Stream<dynamic> get weatherStream => _stateStreamController.stream;


 // for events
 final _eventStreamController = StreamController<dynamic>();
 //for input
 StreamSink<dynamic> get eventSink => _eventStreamController.sink;
 //for output
 Stream<dynamic> get eventStream => _eventStreamController.stream;


 Bloc()
 {

  eventStream.listen((event) async
  {
   var weatherData = await weatherModel.getTypedLocation(event);
   var temp = weatherData['main']['temp'];
   var temperature = temp.toInt();


   //adding temperature to Stream
   _weatherSink.add(temperature);

  });
 }



 void dispose()
 {
  _stateStreamController.close();
  _eventStreamController.close();
 }


}