import 'dart:async';
import 'package:flutter/material.dart';
import '../bases/base_bloc.dart';
import '../bases/base_event.dart';
import '../events/weather_event.dart';
import '../secret.dart';
import 'package:weather/weather.dart';

// class WeatherBloc extends BaseBloc with ChangeNotifier {
//   StreamController _weatherCtrl = StreamController<WeatherEvent>();

//   List<Weather> _weatherData = [];
//   weatherType _type;

//   Stream get weatherStream => _weatherCtrl.stream;

//   Map<String, dynamic> get weatherData => {
//         'type': _type,
//         'data': _weatherData,
//       };

//   @override
//   void dispatch(BaseEvent event) async {
//     // if (event is WeatherEvent) if (event.content ==
//     //     weatherType.currentWeather) {
//     //   _weatherData.isNotEmpty ?? _weatherData.removeLast();
//     //   _weatherData.insert(
//     //       0, await WeatherStation(SecretKeys.weather).currentWeather());

//     //   print('i got simple');
//     //   _type = weatherType.currentWeather;
//     //   notifyListeners();
//     // }
//     // else if (event.content == weatherType.fiveDaysForecast) {
//     //   _weatherData.removeRange(0, _weatherData.length);
//     //   List<Weather> x = await WeatherStation(SecretKeys.weather).fiveDayForecast();
//     //   _weatherData
//     //       .addAll(x);
//     //   print('i got multiple\n>>>>>>>>>>>>> STOP MULTI INVOKES');
//     //   _type = weatherType.fiveDaysForecast;
//     //   notifyListeners();
//     // }
//   }

//   @override
//   void dispose() {
//     _weatherCtrl.close();
//     super.dispose();
//   }
// }


class WeatherBloc extends ChangeNotifier{
  StreamController _weatherCtrl = StreamController<WeatherEvent>();

  List<Weather> _weatherData = [];
  weatherType _type;

  Stream get weatherStream => _weatherCtrl.stream;

  Map<String, dynamic> get weatherData => {
        'type': _type,
        'data': _weatherData,
      };

  @override
  void dispatch(BaseEvent event) async {
    // if (event is WeatherEvent) if (event.content ==
    //     weatherType.currentWeather) {
    //   _weatherData.isNotEmpty ?? _weatherData.removeLast();
    //   _weatherData.insert(
    //       0, await WeatherStation(SecretKeys.weather).currentWeather());

    //   print('i got simple');
    //   _type = weatherType.currentWeather;
    //   notifyListeners();
    // }
    // else if (event.content == weatherType.fiveDaysForecast) {
    //   _weatherData.removeRange(0, _weatherData.length);
    //   List<Weather> x = await WeatherStation(SecretKeys.weather).fiveDayForecast();
    //   _weatherData
    //       .addAll(x);
    //   print('i got multiple\n>>>>>>>>>>>>> STOP MULTI INVOKES');
    //   _type = weatherType.fiveDaysForecast;
    //   notifyListeners();
    // }
  }

  @override
  void dispose() {
    _weatherCtrl.close();
    super.dispose();
  }
}