import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shrimp_2/Providers/Weather.dart';
import 'package:shrimp_2/widgets/weather.dart';
import 'package:weather/weather.dart';

import 'components/grid_item.dart';

class MainTitleList extends StatelessWidget {

  final List<Map> gridItems = [
    {
      'title': 'Môi trường',
      'centerIcon': FontAwesomeIcons.leaf,
      'color': Colors.white,
//      'push': Question(),
    },
    {
      'title': 'Mua bán',
      'centerIcon': FontAwesomeIcons.question,
      'color': Colors.white,
    },
    {
      'title': 'Tin tức',
      'centerIcon': FontAwesomeIcons.newspaper,
      'color': Colors.white,
    },
  ];

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(36, 0, 36, 0),
      itemCount: gridItems.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 24,
        crossAxisSpacing: 24,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, id) {
        return MyGridItem(
          title: gridItems[id]['title'],
          icon: gridItems[id]['centerIcon'],
          color: gridItems[id]['color'],
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => gridItems[id]['push'],
              ),
            );
          },
        );
      },
    );
  }
}
