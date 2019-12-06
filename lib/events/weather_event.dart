import '../bases/base_event.dart';

enum weatherType {
  currentWeather,
  fiveDaysForecast,
}

class WeatherEvent extends BaseEvent{
  final weatherType _content;

  WeatherEvent(content) : _content = content;

  weatherType get content => _content;
}
