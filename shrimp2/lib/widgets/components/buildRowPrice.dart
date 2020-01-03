import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shrimp2/Models/shrimpsize.dart';
import 'package:shrimp2/Models/shrimpType.dart';
import 'package:shrimp2/blocs/shrimpsize_bloc.dart';
import 'package:shrimp2/blocs/prices_bloc.dart';
import 'package:shrimp2/blocs/shrimptype_bloc.dart';
import 'package:shrimp2/events/price_event.dart';
import 'package:shrimp2/widgets/prices_features/detailPrice.dart';
import 'package:shrimp2/widgets/components/buildListTitlePrice.dart';
import 'package:shrimp2/widgets/components/buildRowPrice.dart';

class BuildRowPrice extends StatefulWidget {
  String _shrimpType;
  BuildRowPrice(this._shrimpType);
  @override
  _BuildListShrimpSize createState() => _BuildListShrimpSize(_shrimpType);
}

class _BuildListShrimpSize extends State<BuildRowPrice> {
  ShrimSizeBloc _shrimSizeBloc;
    String _shrimpType;
   _BuildListShrimpSize(this._shrimpType);
  String _shrimp;
  @override
  Widget build(BuildContext context) {
    return Consumer<ShrimSizeBloc>(builder: (context, bloc, child) {
      List<ShrimpSize> _data = bloc.ShrimpSizeData['data'];
      return ListView.builder(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(6.0),
        
        itemCount: _data.length,
        itemBuilder: (context, int index) {
        Uint8List bytes = base64.decode(_data[index].shrimpSizeImgae);
          return GestureDetector(
            onTap: () {
              print('click');
              String anh;
              anh = _data[index].shrimpSizeImgae;
              print(base64.decode(_data[index].shrimpSizeImgae));
              print(anh);
              Provider.of<PriceBloc>(context).event.add(PriceEvent(priceType.getAllData, _data[index].shrimpSizeQuantity,_shrimpType));
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailPrice()));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 50,
                        width: 50,
                          child: Image.memory(base64Decode(_data[index].shrimpSizeImgae)) ,
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
                      child: Text('Xem chi tiết', style: TextStyle(fontSize: 20.0)),
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
