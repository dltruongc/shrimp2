import 'package:flutter/material.dart';
import 'package:shrimp_2/widgets/components/icon_column.dart';
import 'package:shrimp_2/widgets/components/my_appbar.dart';
import 'package:shrimp_2/widgets/components/videos.dart';
import 'package:shrimp_2/widgets/main_title.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Trang chủ')),
          body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            VideoWidget(),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconColumn(),
                  IconColumn(),
                  IconColumn(),
                ],
              ),
            ),
            Container(
              height: 350,
              child: MainTitleList(),
            ),
          ],
        ),
      ),
    );
  }
}