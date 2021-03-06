import 'package:flutter/material.dart';

class MyGridItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String centerTitle;
  final Function onPressed;

  MyGridItem({
    @required this.icon,
    this.color,
    this.title,
    this.centerTitle,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: GestureDetector(
        child: GridTile(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF00A3B3),
              border: Border.all(
                color: Color(0xFF012A33),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                centerTitle == null ? Icon(
                  icon,
                  size: 48,
                  color: color,
                ): Text(
                  centerTitle != null ? centerTitle : '',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 36,
                  ),
                ),
                Text(
                  title != null ? title : '',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}
