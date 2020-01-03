import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shrimp2/Models/shrimpType.dart';
import 'package:shrimp2/blocs/shrimptype_bloc.dart';
import 'package:shrimp2/blocs/prices_bloc.dart';
import 'package:shrimp2/blocs/shrimptype_bloc.dart';
import 'package:shrimp2/widgets/prices_features/detailPrice.dart';
import 'package:shrimp2/widgets/components/buildListTitlePrice.dart';
import 'package:shrimp2/widgets/components/buildRowPrice.dart';

class BuildTitleShrimpType extends StatefulWidget {
  @override
  _BuildTitleShrimpTypeState createState() => _BuildTitleShrimpTypeState();
}

class _BuildTitleShrimpTypeState extends State<BuildTitleShrimpType> {
  ShrimTypeBloc _shrimTypeBloc;
  String _typeshrimp;
  @override
  Widget build(BuildContext context) {
    return Consumer<ShrimTypeBloc>(
      builder: (context, bloc, child) {
        List<ShrimpType> _data = bloc.ShrimpTypeData['data'];
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: _data.length,
          itemBuilder: (context, int index) {
            _typeshrimp = _data[index].shrimpTypeName;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
               Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
              decoration: BoxDecoration(
                color: Color(0xff1AA1B0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _data[index].shrimpTypeName.toUpperCase(),
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: .5),
                  ),
                  Divider(
                    color: Colors.black45,
                  ),
                ],
              ),
            ),
            Container(
              height: 280,
              child: BuildRowPrice(_typeshrimp),
            ),
            
            
              ],
            );
          },
        );
      },
    );
  }
}
