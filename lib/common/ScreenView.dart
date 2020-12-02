import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:manektechtask/models/weatherInfo.dart';
import 'package:manektechtask/services/Bloc.dart';
import 'package:manektechtask/utilities/constants.dart';
import 'package:http/http.dart';
import 'package:manektechtask/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:manektechtask/services/weather.dart';

class ScreenView extends StatefulWidget
{
  ScreenView(
      {
        this.cityName,
        this.backgroundImage,

      });

  final cityName;
  final backgroundImage;

  @override
  _ScreenViewState createState() => _ScreenViewState();
}

class _ScreenViewState extends State<ScreenView>
{
  final weatherBloc = Bloc();

  WeatherModel weather = new WeatherModel();


  @override
  void initState()
  {
    weatherBloc.eventSink.add(widget.cityName);
    super.initState();

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            // image: AssetImage('images/grass.jpg'),
            image: AssetImage(widget.backgroundImage),

            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        child: StreamBuilder<dynamic>(
          stream: weatherBloc.weatherStream,
          builder: (context, snapshot)
          {
            if (snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    AutoSizeText("${widget.cityName}",
                      maxLines: 1,
                      style: kMessageTextStyle,


                    ),
                    Center(
                      child: Text(
                        "${snapshot.data}°",
                        overflow: TextOverflow.ellipsis,
                        style: kTempTextStyle,
                      ),
                    ),

                  ],
                ),
              );
            }
            else
              return
                Center(
                  child: SpinKitRipple(
                    color: Colors.white,
                    size: 100.0,

                  ),
                );
          },
        ),
      ),
    );
  }
}


