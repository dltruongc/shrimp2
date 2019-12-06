import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../blocs/weather_bloc.dart';
import 'package:weather/weather.dart';

class WeatherTitleBuild extends StatefulWidget {
  @override
  _WeatherTitleBuildState createState() => _WeatherTitleBuildState();
}

class _WeatherTitleBuildState extends State<WeatherTitleBuild> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherBloc>(
      builder: (_, bloc, child) {
        Weather weather = bloc.weatherData['data'].first;
        print(weather);
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              weather.areaName,
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            Text(
              '${weather.temperature.celsius.round()}\u2070C',
              style: TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.w300,
                letterSpacing: -3,
              ),
            ),
            Text(
              weather.weatherDescription,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
            ),
            Text(
              'Độ ẩm: ${weather.humidity}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text.rich(
                  TextSpan(
                    text: 'Cao nhất:',
                    children: [
                      TextSpan(
                        text:
                            '\n${weather.tempMax.celsius.toStringAsFixed(1)}\u2070C',
                            style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: 'Thấp nhất:',
                    children: [
                      TextSpan(
                        text:
                            '\n${weather.tempMin.celsius.toStringAsFixed(1)}\u2070C',
                            style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
