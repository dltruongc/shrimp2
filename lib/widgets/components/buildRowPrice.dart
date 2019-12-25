import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shrimp2/Models/shrimpsize.dart';
import 'package:shrimp2/blocs/shrimpsize_bloc.dart';
import 'package:shrimp2/blocs/prices_bloc.dart';
import 'package:shrimp2/blocs/shrimptype_bloc.dart';
import 'package:shrimp2/widgets/prices_features/detailPrice.dart';
import 'package:shrimp2/widgets/components/buildListTitlePrice.dart';
import 'package:shrimp2/widgets/components/buildRowPrice.dart';

class BuildRowPrice extends StatefulWidget {
  @override
  _BuildListShrimpSize createState() => _BuildListShrimpSize();
}

class _BuildListShrimpSize extends State<BuildRowPrice> {
  ShrimSizeBloc _shrimSizeBloc;
  @override
  Widget build(BuildContext context) {
    return Consumer<ShrimSizeBloc>(builder: (context, bloc, child) {
      List<ShrimpSize> _data = bloc.ShrimpSizeData['data'];
      return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(6.0),
        itemCount: _data.length,
        itemBuilder: (context, int index) {
          return GestureDetector(
            onTap: () {
              print('click');
              Provider.of<PriceBloc>(context).getAllPrice();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailPrice()));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //_buildRow(_typeShrimp.type, Icons.navigate_next),
                //BuildRowPrice.title(title: _typeShrimp.type),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Image.asset('lib/assets/icon30n.png'),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                      child: Text(
                        _data[index].shrimpSizeQuantity.toString() + _data[index].shrimpSizeUnit.toString(),
                        style: TextStyle(fontSize: 20.0),
                      ),
                      flex: 2,
                    ),
                    Expanded(
                      child: Text('180.000đ', style: TextStyle(fontSize: 20.0)),
                      flex: 2,
                    ),
                    Expanded(
                      child: Icon(Icons.navigate_next),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black45,
                ),
              ],
            ),
          );
        },
      );
    });
  }
}

class BuildRowPrice1 {
  static title({String title}) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Expanded(
        child: Container(
          height: 50,
          width: 50,
          child: Image.asset('lib/assets/icon30n.png'),
        ),
        flex: 1,
      ),
      Expanded(
        child: Text(
          title,
          style: TextStyle(fontSize: 20.0),
        ),
        flex: 2,
      ),
      Expanded(
        child: Text('180.000đ', style: TextStyle(fontSize: 20.0)),
        flex: 2,
      ),
      Expanded(
        child: Icon(Icons.navigate_next),
      ),
    ],
  );
}
