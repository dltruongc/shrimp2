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
        // gradient: LinearGradient(
        //   colors: [
        //     Color(0xFF012A33),
        //     Color(0xff22B1A9),
        //   ],
        //   stops: [
        //     0.1,
        //     0.85,
        //   ],
        //   begin: Alignment.bottomLeft,
        //   end: Alignment.topRight,
        // ),
      );
}
