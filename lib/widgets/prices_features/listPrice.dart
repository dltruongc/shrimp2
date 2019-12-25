import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shrimp2/blocs/prices_bloc.dart';
import 'package:shrimp2/Models/shrimpprice.dart';
import 'package:intl/intl.dart';
import 'package:shrimp2/widgets/components/buildListTitleDate.dart';
import 'package:shrimp2/widgets/prices_features/detailPrice.dart' as prefix0;

final dateFormatter = DateFormat('dd-MM-yyyy');

class ListBuilderPrice extends StatefulWidget {
  @override
  _ListBuilderPriceState createState() => _ListBuilderPriceState();
}

class _ListBuilderPriceState extends State<ListBuilderPrice> {
  PriceBloc _priceBloc;

  List<ShrimpPrice> _listPrice;

  @override
  Widget build(BuildContext context) {
    return Consumer<PriceBloc>(
      builder: (context, bloc, child){
        List<ShrimpPrice> _data = bloc.PriceData['data'];
        return ListView.builder(
          itemCount: _data.length,
          itemBuilder: (context, int index){
            return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BuildListTitleDate.title(
                title: dateFormatter.format(_data[index].datePrice)),
               _buildRow(_data[index].price.toString() + ' đồng/kg', Icons.insert_chart),

          ],
        );
          } ,
        );
      },
    );
}

}

ListTile _buildRow(String title, IconData icon) {
  return ListTile(
    title: Text(
          title,
          style: TextStyle(fontSize: 20),
        ) ??
        '',
    trailing: Icon(
      icon,
      color: Color(0xff004C64),
      size: 40,
    ),
  );
}

