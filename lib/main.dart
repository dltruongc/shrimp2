import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrimp_2/blocs/weather_bloc.dart';
import 'package:shrimp_2/widgets/home.dart';
import 'package:shrimp_2/widgets/post.dart';
import 'package:shrimp_2/widgets/settings.dart';
import './widgets/components/icon_column.dart';
import './widgets/components/videos.dart';
import './widgets/main_title.dart';
import './widgets/components/my_appbar.dart';
import 'events/weather_event.dart';

void main() {
  WeatherBloc weatherBloc = WeatherBloc();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherBloc>(
          create: (context) => weatherBloc,
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
  int _currentPage = 1;

  List<Widget> _loadPage = [
    PostPage(),
    HomePage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loadPage[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        unselectedItemColor: Colors.black,
        items: [
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
        onTap: (int _index) {
          setState(() {
            _currentPage = _index;
          });
        },
      ),
    );
  }
}
