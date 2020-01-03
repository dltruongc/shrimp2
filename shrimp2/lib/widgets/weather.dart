import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../blocs/weather_bloc.dart';
import '../events/weather_event.dart';
import '../widgets/weather/weather_list_build.dart';
import '../widgets/weather/weather_title_build.dart';

class WeatherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.refresh),
        label: Text('Tải lại'),
        onPressed: () {
          Provider.of<WeatherBloc>(context)
              .event
              .add(WeatherEvent(weatherType.fiveDaysForecast));
        },
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/weather_wallpaper.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: Colors.white24,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: WeatherTitleBuild(),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                      color: Colors.white38, child: WeatherListBuild()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
