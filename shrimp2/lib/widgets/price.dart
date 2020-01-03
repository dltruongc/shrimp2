import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrimp2/blocs/prices_bloc.dart';
import 'package:shrimp2/blocs/shrimptype_bloc.dart';
import 'package:shrimp2/widgets/prices_features/detailPrice.dart';
import 'package:shrimp2/widgets/components/buildListTitlePrice.dart';
import 'package:shrimp2/widgets/components/buildRowPrice.dart';
import 'package:shrimp2/widgets/components/buildTitleShrimpType.dart';
class PricePage extends StatefulWidget {
  @override
  _PricePageState createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
  ShrimTypeBloc _shrimTypeBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _shrimTypeBloc = ShrimTypeBloc();
  }

  @override
  void dispose() async {
    // TODO: implement dispose
    _shrimTypeBloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Giá cả',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF14808C),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    // Add one stop for each color. Stops should increase from 0 to 1
                    stops: [0.5, 0.85],
                    colors: [
                      // Colors are easy thanks to Flutter's Colors class.
                      Color(0xFF14808C),
                      Color(0xff79CCD3),
                    ],
                  ),
                ),
                child: Center(
                  child: Text(
                    "Giá tôm hiện nay đang tăng cao theo nhu cầu thị hiếu của thị trường...",
                    style: TextStyle(fontSize: 30.0, color: Colors.white),
                  ),
                ),
              ),
             
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text(
                        'gia tom hien nay...',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Center(
                      child: Text(
                        'gia tom hien nay...',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height*5/10,
                child: BuildTitleShrimpType(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTitle(String title) {
  return Container(
    // margin: const EdgeInsets.all(5),
    padding: const EdgeInsets.fromLTRB(20, 5, 5, 5),
    decoration: BoxDecoration(
      color: Color(0xff1AA1B0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          title.toUpperCase(),
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
  );
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



