import 'package:flutter/material.dart';
import 'package:manektechtask/screens/HomeScreen.dart';
import 'package:manektechtask/screens/location_screen.dart';
import 'package:flutter/services.dart';


void main()
{
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: HomeScreen(),

    );
  }
}
