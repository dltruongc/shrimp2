import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrimp_2/Providers/Weather.dart';
import 'package:weather/weather.dart';


class WeatherTitleBuild extends StatelessWidget {
  final Weather weather;

  WeatherTitleBuild({this.weather});

  @override
  Widget build(BuildContext context) {
//    print(_weather);
    return Column(
      children: <Widget>[
        Text(
          weather.areaName,
          style: TextStyle(
            fontSize: 28,
          ),
        ),
        SizedBox(
          height: 32,
        ),
        Text(
          '${weather.temperature.celsius.round()}\u2070C',
          style: TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.w300,
            letterSpacing: -3,
          ),
        ),
        SizedBox(
          height: 32,
        ),
        Text(
          weather.weatherDescription,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          'Độ ẩm: ${weather.humidity}',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w300,
          ),
        ),
//        Text('faefw:  $_weather'),
      ],
    );
  }
}
