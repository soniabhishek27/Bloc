import 'package:manektechtask/screens/loading_screen.dart';
import 'package:manektechtask/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:manektechtask/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String CityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute
                      (
                      builder: (context)  {
                        return LoadingScreen();
                      }
                    )


                    );



                  },


                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(30.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldInput,
                  onChanged: (value)
                  {
                    CityName = value;
                    
                  },
                )
              ),
              FlatButton(
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pop(context,CityName);

                },
                child: Text(
                  'Get Weather',
                  style: TextStyle
                    (
                    color: Colors.white,
                    fontSize: 40.0,


                  ),
                  textAlign: TextAlign.center,


                ),

              ),
            ],
          ),
        ),
      ),
    );
  }

}
