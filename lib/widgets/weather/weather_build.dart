import 'package:flutter/material.dart';

class WeatherListBuild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8),
      itemCount: 4,
      itemBuilder: (context, id) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: Text(
                'Hôm nay',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.wb_sunny,
                    color: Colors.white,
                  ),
                  Text(
                    ' Nắng',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              trailing: Text(
                '32\u2070C',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Divider(
              color: Colors.white54,
            ),
          ],
        );
      },
    );
  }
}
