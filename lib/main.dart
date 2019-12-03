import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrimp_2/Providers/Weather.dart';
import 'package:shrimp_2/widgets/components/icon_column.dart';
import './widgets/components/videos.dart';
import './widgets/main_title.dart';
import './widgets/components/my_appbar.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF00A3B3),
        primaryTextTheme: TextTheme(
          body1: TextStyle(color: Colors.white),
        ),
        primaryIconTheme: IconThemeData(color: Color(0xFF012A33)),
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.blue),
          body2: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.orange,
        ),
      ),
      home: ChangeNotifierProvider<WeatherProvider>.value(
        value: WeatherProvider(),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.title(title: 'Trang chủ'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: VideoComponent(),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconColumn(),
                IconColumn(),
                IconColumn(),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: MainTitleList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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
      ),
    );
  }
}
