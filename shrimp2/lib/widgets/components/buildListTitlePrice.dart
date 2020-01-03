import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrimp2/blocs/prices_bloc.dart';
import 'package:shrimp2/Models/shrimpprice.dart';
import 'package:shrimp2/Models/shrimpType.dart';
import 'package:shrimp2/blocs/shrimptype_bloc.dart';
import '../components/buildRowPrice.dart';
import 'package:shrimp2/blocs/shrimpsize_bloc.dart';

class BuildListTitle extends StatefulWidget {
  @override
  _BuildListTitleState createState() => _BuildListTitleState();
}

class _BuildListTitleState extends State<BuildListTitle> {
  ShrimSizeBloc _shrimSizeBloc;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _shrimSizeBloc = ShrimSizeBloc();
  }

  @override
  void dispose() async {
    // TODO: implement dispose
    _shrimSizeBloc.dispose();
    super.dispose();
  }

  ShrimTypeBloc _shrimTypeBloc;
  List<ShrimpType> _listShrimpType;
  @override
  Widget build(BuildContext context) {
    return Consumer<ShrimTypeBloc>(builder: (context, bloc, child) {
      List<ShrimpType> _data = bloc.ShrimpTypeData['data'];
      return ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, int index) {
          return Container(
            padding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
            decoration: BoxDecoration(
              color: Color(0xff1AA1B0), //1AA1B0
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  _data[index].shrimpTypeName.toString(),
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: .5),
                ),
                Divider(
                  color: Colors.black45,
                ),
                //BuildRowPrice(),
              ],
            ),
          );
        },
      );
    });
  }
}
// class BuildListTitle{
//   static title ({String title})=>Container(
//     // margin: const EdgeInsets.all(5),
//     padding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
//     decoration: BoxDecoration(
//       color: Color(0xff1AA1B0), //1AA1B0
//     ),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: <Widget>[
//         Text(
//           title.toUpperCase(),
//           style: TextStyle(
//               fontSize: 20.0,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//               letterSpacing: .5),
//         ),
//         Divider(
//           color: Colors.black45,
//         ),
//       ],
//     ),
//   );
// }
