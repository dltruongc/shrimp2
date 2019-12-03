import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class MyAppBar {
  static title({String title}) => GradientAppBar(
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
