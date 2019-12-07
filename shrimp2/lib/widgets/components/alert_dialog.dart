import 'package:flutter/material.dart';

class MyAlertDialog {
  static void show({BuildContext context, String title, String content, List<Widget> actions}) {
    actions.add(
      FlatButton(
        child: Text('Đóng'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
          content: new Text(content),
          actions: actions,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        );
      },
    );
  }
}