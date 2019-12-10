import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:shrimp2/widgets/components/buildListTitleDate.dart';

final dateFormatter = DateFormat('dd-MM-yyyy');

class ShrimpPrice {
  DateTime ngay;
  String price;

  ShrimpPrice(this.ngay, this.price);
}

List<ShrimpPrice> _data = [
  ShrimpPrice(DateTime(2019, 01, 01), '180.000'),
  ShrimpPrice(DateTime(2019, 01, 01), '180.000'),
  ShrimpPrice(DateTime(2019, 01, 01), '180.000'),
  ShrimpPrice(DateTime(2019, 01, 01), '180.000'),
  ShrimpPrice(DateTime(2019, 01, 01), '180.000'),
  ShrimpPrice(DateTime(2019, 01, 01), '180.000'),
  ShrimpPrice(DateTime(2019, 01, 01), '180.000'),
  ShrimpPrice(DateTime(2019, 01, 01), '180.000'),
  ShrimpPrice(DateTime(2019, 01, 01), '180.000'),
  ShrimpPrice(DateTime(2019, 01, 01), '180.000'),
  ShrimpPrice(DateTime(2019, 01, 01), '180.000'),
  ShrimpPrice(DateTime(2019, 01, 01), '180.000'),
];

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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 150,
                    height: 150,
                    margin: EdgeInsets.only(top: 20),
                    child: Center(
                      child: Image.asset('lib/assets/icon50n.png'),
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Giá tôm thẻ loại 50 con/kg ...',
                  style: TextStyle(fontSize: 24.0),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: _buildListView(),
            ),
          ],
        ),
      ),
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

ListView _buildListView() {
  return ListView.builder(
    scrollDirection: Axis.vertical,
    padding: const EdgeInsets.all(6.0),
    itemCount: _data.length,
    itemBuilder: (BuildContext context, int index) {
      ShrimpPrice _shrimpprice = _data[index];
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetailPrice()));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //_buildRow(_typeShrimp.type, Icons.navigate_next),
            BuildListTitleDate.title(
                title: dateFormatter.format(_shrimpprice.ngay)),
            _buildRow(_shrimpprice.price + ' đồng/kg', Icons.insert_chart),
          ],
        ),
      );
    },
  );
}
