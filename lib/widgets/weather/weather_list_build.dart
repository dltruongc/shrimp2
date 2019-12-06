import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../blocs/weather_bloc.dart';
import 'package:weather/weather.dart';

List _weekDay = [
  'NO DATA',
  'Thứ 2',
  'Thứ 3',
  'Thứ 4',
  'Thứ 5',
  'Thứ 6',
  'Thứ 7',
  'Chủ nhật',
];

class WeatherListBuild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(_weekDay.length);
    return Consumer<WeatherBloc>(
      builder: (context, bloc, child) {
        List<Weather>data=bloc.weatherData['data'];
        return ListView.builder(
          padding: const EdgeInsets.only(top: 8),
          itemCount: data.length,
          itemBuilder: (context, id) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  leading: Text(
                    _weekDay[data[id].date.weekday],
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.wb_sunny,
                        color: Colors.white,
                      ),
                      Text(
                        data[id].date.hour.toString() + ' giờ',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                  trailing: Text(
                    '${data[id].temperature.celsius.toStringAsFixed(1)}\u2070C',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Divider(
                  color: Colors.white54,
                ),
              ],
            );
          },
        );
      }
    );
  }
}
