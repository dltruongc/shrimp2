import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrimp2/widgets/post.dart';
import 'package:shrimp2/widgets/settings.dart';
import './widgets/home.dart';
import 'blocs/login_bloc.dart';
import 'blocs/weather_bloc.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherBloc>(
          create: (_) => WeatherBloc(),
        ),
        ChangeNotifierProvider<LoginBloc>(
          create: (_) => LoginBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xFF00A3B3),
          primaryTextTheme: TextTheme(
            body1: TextStyle(color: Colors.black),
          ),
          primaryIconTheme: IconThemeData(color: Color(0xFF012A33)),
        ),
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _widgets = [
    PostPage(),
    HomePage(),
    SettingPage(),
  ];

  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgets[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 12.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Hỏi đáp'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Trang chủ'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Cài đặt'),
          ),
        ],
        onTap: (id) {
          setState(() {
            _currentIndex = id;
          });
        },
        currentIndex: _currentIndex,
      ),
    );
  }
}
