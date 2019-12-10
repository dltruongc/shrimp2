import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildListTitleDate{
  static title ({String title})=>Container(
    // margin: const EdgeInsets.all(5),
    padding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
    decoration: BoxDecoration(
      color: Color(0xffE8FDFF), //1AA1B0
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          title.toUpperCase(),
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xff1AA1B0),
              letterSpacing: .5),
        ),
        Divider(
          color: Colors.black45,
        ),
      ],
    ),
  );
}