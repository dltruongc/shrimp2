import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shrimp2/Models/shrimpprice.dart';
import 'package:shrimp2/widgets/components/buildListTitleDate.dart';
import 'package:shrimp2/blocs/prices_bloc.dart';
import 'package:shrimp2/blocs/shrimptype_bloc.dart';
import 'package:shrimp2/widgets/prices_features/listPrice.dart';
import '../components/buildListTitlePrice.dart';
import '../components/buildRowPrice.dart';
import 'package:shrimp2/blocs/shrimpsize_bloc.dart';

final dateFormatter = DateFormat('dd-MM-yyyy');


class DetailPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Color(0xFF14808C),
        title: Text(
          'Giá cả chi tiết',
          style: TextStyle(fontSize: 24.0),
        ),
        centerTitle: true,
      ),
      body: DetailPriceUI(),
    );
  }
}

class DetailPriceUI extends StatefulWidget {
  @override
  _DetailPriceUIState createState() => _DetailPriceUIState();
}

class _DetailPriceUIState extends State<DetailPriceUI> {
  ShrimTypeBloc _shrimTypeBloc;
  PriceBloc _pricebloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pricebloc = PriceBloc();
  }

  @override
  void dispose() async {
    // TODO: implement dispose
    _pricebloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PriceBloc>(
        builder: (context, bloc, child) {
          List<ShrimpPrice> _data = bloc.PriceData['data'];
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 150,
                        margin: EdgeInsets.only(top: 20),
                        child: Center(
                          child: Image.memory(base64Decode(_data[index].shrimpSize.shrimpSizeImgae)), //Image.asset('lib/assets/icon50n.png'),
                        )),
                      SizedBox(
                          height: 10,
                      ),
                      Text('Giá '.toUpperCase() + _data[index].shrimpType.shrimpTypeName.toUpperCase(),
                      style: TextStyle(fontSize: 24.0)),
                      Text('Loại '.toUpperCase() + 
                        _data[index].shrimpSize.shrimpSizeQuantity.toString().toUpperCase() +
                        _data[index].shrimpSize.shrimpSizeUnit.toUpperCase(),
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height,
                        child: ListBuilderPrice(),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        },
      );
  }}