import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './blocs/weather_bloc.dart';
import './widgets/home.dart';
import 'blocs/login_bloc.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF00A3B3),
        primaryTextTheme: TextTheme(
          body1: TextStyle(color: Colors.black),
        ),
        primaryIconTheme: IconThemeData(color: Color(0xFF012A33)),
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<WeatherBloc>.value(
            value: WeatherBloc(),
          ),
          ChangeNotifierProvider<LoginBloc>.value(
            value: LoginBloc(),
          ),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
    );
  }
}
