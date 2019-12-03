import 'package:flutter/material.dart';

class IconColumn extends StatefulWidget {
  @override
  _IconColumnState createState() => _IconColumnState();
}

class _IconColumnState extends State<IconColumn> {
  @override
  Widget build(BuildContext context) {
    Color _color = Colors.black;
    return Column(
      children: <Widget>[
        Container(
          width: 32,
          height: 32,
          child: Image.asset(
            'lib/assets/shrimp_ico.png',
            color: Color(0xEEEC3B6B),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          '99.000đ',
          style: TextStyle(
            fontSize: 20,
            color: _color,
            fontWeight: FontWeight.w300,
            letterSpacing: -1,
            // fontFamily: 'Gupter',
          ),
        ),
        Text(
          'Tôm thẻ',
          style: TextStyle(
            fontSize: 12,
            color: _color,
          ),
        ),
      ],
    );
  }
}
