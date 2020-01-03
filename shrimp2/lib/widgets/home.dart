import 'package:flutter/material.dart';
import '../widgets/components/icon_column.dart';
import '../widgets/components/videos.dart';
import '../widgets/main_title.dart';

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
