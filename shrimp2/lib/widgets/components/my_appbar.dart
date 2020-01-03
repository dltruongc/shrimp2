import 'package:flutter/material.dart';

class MyAppBar {
  static title({String title}) => AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      );
}
