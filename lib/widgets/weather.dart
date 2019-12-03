import 'package:flutter/material.dart';
import 'package:shrimp_2/widgets/components/weather_title_build.dart';
import 'package:shrimp_2/widgets/components/weather_build.dart';
import 'package:weather/weather.dart';

class WeatherWidget extends StatelessWidget {
  final Weather weather;

  WeatherWidget({this.weather});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
//      appBar: MyAppBar.title(title: 'Thời tiết'),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/weather_wallpaper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black38,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: WeatherTitleBuild(weather: weather),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(color: Colors.black26),
                  child: weather_build(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
