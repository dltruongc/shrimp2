import 'package:flutter/material.dart';

class VideoComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          height: 200,
          width: 300,
          child: Icon(
            Icons.play_arrow,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
