import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../blocs/weather_bloc.dart';
import '../events/weather_event.dart';
import 'package:weather/weather.dart';

import '../widgets/weather.dart';
import './components/grid_item.dart';
import '../widgets/price.dart';
import '../blocs/shrimptype_bloc.dart';
import '../blocs/shrimpsize_bloc.dart';
import '../events/shrimpsize_event.dart';
import '../events/shrimptype_event.dart';

class MainTitleList extends StatefulWidget {
  @override
  _MainTitleListState createState() => _MainTitleListState();
}

class _MainTitleListState extends State<MainTitleList> {
  static const List<Map> gridItems = [
    const {
      'title': 'Thời tiết',
      'centerIcon': FontAwesomeIcons.cloudSun,
      'color': Colors.white,
    },
    const {
      'title': 'Môi trường',
      'centerIcon': FontAwesomeIcons.leaf,
      'color': Colors.white,
//      'push': Question(),
    },
    const {
      'title': 'Giá cả',
      'centerIcon': FontAwesomeIcons.coins,
      'color': Colors.white,
    },
    const {
      'title': 'Tin tức',
      'centerIcon': FontAwesomeIcons.newspaper,
      'color': Colors.white,
    },
  ];
  weatherType type;
  List<Weather> weatherData;
  @override
  Widget build(BuildContext context) {
    WeatherBloc bloc = Provider.of<WeatherBloc>(context, listen: true);
    if (bloc.weatherData['data'].isEmpty)
      bloc.event.add(WeatherEvent(weatherType.fiveDaysForecast));
    type = bloc.weatherData['type'];
    weatherData = bloc.weatherData['data'];

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
        Stack(
          alignment: AlignmentDirectional.center,
          fit: StackFit.expand,
          children: [
            MyGridItem(
              title: gridItems[0]['title'],
              icon: null,
              color: gridItems[0]['color'],
              centerTitle: type != null
                  ? weatherData.first.temperature.celsius.toStringAsFixed(0) +
                      '\u2070C'
                  : null,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WeatherWidget(),
                  ),
                );
              },
            ),
            Positioned(
              top: 20,
              child: Container(
                height: 50,
                width: 50,
                child: type != null? SizedBox(): 
                CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  strokeWidth: 6,
                ),
              ),
            ),
          ],
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
          onPressed: () {
            print('click');
            // Provider.of<ShrimTypeBloc>(context).getAllShrimpType();
            // Provider.of<ShrimSizeBloc>(context).getAllShrimpSize();
            Provider.of<ShrimSizeBloc>(context).event.add(ShrimSizeEvent(ShrimpSizeEnum.getAllData));
            Provider.of<ShrimTypeBloc>(context).event.add(ShrimTypeEvent(ShrimTypeEnum.getAllData));
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => PricePage() ),
            );
          },
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
