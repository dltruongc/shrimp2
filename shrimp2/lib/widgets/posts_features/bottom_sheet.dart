import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBottomSheet {
  mainBottomSheet (BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            _createTile(Icons.link, 'Message1', () {
              print('me1');
              Navigator.pop(context);
            }),
            _createTile(Icons.link, 'Message2', () {
              print('me2');
              Navigator.pop(context);
            }),
            _createTile(Icons.link, 'Message3', () {
              print('me3');
              Navigator.pop(context);
            }),
            _createTile(Icons.link, 'Message4', () {
              print('me4');
              Navigator.pop(context);
            }),
          ],
        );
      }
    );
  }

  ListTile _createTile(IconData icon, String title, Function action) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        action();
      }
    );
  }

  
}

