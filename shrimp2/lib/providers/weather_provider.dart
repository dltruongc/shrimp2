import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

import '../secret.dart';

class WeatherProvider with ChangeNotifier {
  Weather _weather;
  List<Weather> _weathers;

  Future<Weather> getWeather () async {
    _weather =  await WeatherStation(SecretKeys.weather).currentWeather();
    print('call me');
    notifyListeners();
    return _weather;
  }

  Future<List<Weather>> getWeatherFiveDays () async {
    _weathers =  await WeatherStation(SecretKeys.weather).fiveDayForecast();
    print('call me multi');
    notifyListeners();
    return _weathers;
  }

  get weather => _weather;
  get fiveDayWeather => _weathers;
}