
import 'package:flutter/material.dart';
import 'package:manektechtask/common/ScreenView.dart';
import 'package:manektechtask/screens/loading_screen.dart';
import 'package:manektechtask/screens/location_screen.dart';

//this class is the Starting Class it contains page view of all other city classes


class HomeScreen extends StatefulWidget {
  static String id = 'HomeScreen';


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView(

        children: [
          LocationScreen(),
          //
          ScreenView(cityName: "Mumbai", backgroundImage: 'images/location_background.jpg',),
          ScreenView(cityName: "Delhi",backgroundImage: 'images/background@2x.jpg',),
          ScreenView(cityName: "Bangalore",backgroundImage: 'images/grass.jpg'),
          ScreenView(cityName: "Udaipur",backgroundImage: 'images/city_background.jpg'),


        ],
      ),
    );
  }
}
