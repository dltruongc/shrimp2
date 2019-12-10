import 'package:flutter/material.dart';

class BuildRowPrice {
  static title({String title}) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Expanded(
        child: Container(
          height: 50,
          width: 50,
          child: Image.asset('lib/assets/icon30n.png'),
        ),
        flex: 1,
      ),
      Expanded(
        child: Text(
          title,
          style: TextStyle(fontSize: 20.0),
        ),
        flex: 2,
      ),
      Expanded(
        child: Text('180.000đ', style: TextStyle(fontSize: 20.0)),
        flex: 2,
      ),
      Expanded(
        child: Icon(Icons.navigate_next),
      ),
    ],
  );
}