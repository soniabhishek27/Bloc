import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


//this class fetch the current location

class Location
{

  double latitude,longitude;


  getCurrentLocation() async
  {
    try{
      Position position = await
      Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
    }
    catch(e)
    {
      print(e);
    }
  }

}