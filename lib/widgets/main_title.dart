import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shrimp_2/blocs/weather_bloc.dart';
import 'package:shrimp_2/events/weather_event.dart';
import 'package:weather/weather.dart';

import '../widgets/weather.dart';
import './components/grid_item.dart';

class MainTitleList extends StatefulWidget {
  @override
  _MainTitleListState createState() => _MainTitleListState();
}

const List<Map> gridItems = [
  {
    'title': 'Thời tiết',
    'centerIcon': FontAwesomeIcons.cloudSun,
    'color': Colors.white,
    'centerTitle': '\u2070C',
    // 'push': WeatherWidget,
  },
  {
    'title': 'Môi trường',
    'centerIcon': FontAwesomeIcons.leaf,
    'color': Colors.white,
//      'push': Question(),
  },
  {
    'title': 'Giá cả',
    'centerIcon': FontAwesomeIcons.question,
    'color': Colors.white,
  },
  {
    'title': 'Tin tức',
    'centerIcon': FontAwesomeIcons.newspaper,
    'color': Colors.white,
  },
];

class _MainTitleListState extends State<MainTitleList> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: new NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(36, 0, 36, 0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
        childAspectRatio: 1.0,
      ),
      children: <Widget>[
        Consumer<WeatherBloc>(
          builder: (context, bloc, child) {
            weatherType type = bloc.weatherData['data'].isEmpty
                ? null
                : bloc.weatherData['type'];
            List<Weather> weatherData = bloc.weatherData['data'].isEmpty
                ? null
                : bloc.weatherData['data'];
            if (bloc.weatherData['data'].isEmpty)
              bloc.event.add(WeatherEvent(weatherType.fiveDaysForecast));

            return MyGridItem(
              title: gridItems[0]['title'],
              icon: gridItems[0]['centerIcon'],
              color: gridItems[0]['color'],
              centerTitle: type != null
                  ? type != weatherType.currentWeather
                      ? weatherData.first.temperature.celsius
                              .toStringAsFixed(0) +
                          '\u2070C'
                      : weatherData.first.temperature.celsius
                              .toStringAsFixed(0) +
                          '\u2070C'
                  : null,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WeatherWidget(),
                  ),
                );
              },
            );
          },
        ),
        MyGridItem(
          title: gridItems[1]['title'],
          icon: gridItems[1]['centerIcon'],
          color: gridItems[1]['color'],
          onPressed: () {},
        ),
        MyGridItem(
          title: gridItems[2]['title'],
          icon: gridItems[2]['centerIcon'],
          color: gridItems[2]['color'],
          onPressed: () {},
        ),
        MyGridItem(
          title: gridItems[3]['title'],
          icon: gridItems[3]['centerIcon'],
          color: gridItems[3]['color'],
          onPressed: () {},
        ),
      ],
    );
  }
}
