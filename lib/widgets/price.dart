import 'package:flutter/material.dart';
import 'package:shrimp2/widgets/prices_features/detailPrice.dart';
import 'package:shrimp2/widgets/components/buildListTitle.dart';
import 'package:shrimp2/widgets/components/buildRowPrice.dart';

class PricePage extends StatefulWidget {
  @override
  _PricePageState createState() => _PricePageState();
}

class _PricePageState extends State<PricePage> {
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
              //------- tom the --------------
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
                // margin: const EdgeInsets.all(10),
                child: BuildListTitle.title(title: 'Tôm thẻ'),
              ),
              Container(
                height: 210,
                child: _buildListView(),
              ),

              //-------end tom the-----------
              SizedBox(
                height: 30,
              ),
              //-------tom su ---------------

              Container(
                // margin: const EdgeInsets.all(10),
                child: BuildListTitle.title(title: 'Tôm sú'),
              ),
              Container(
                height: 210,
                child: _buildListView(),
              ),
              //--------end tom su------------

              SizedBox(
                height: 30,
              ),
              //-------tom cang xanh ---------------
              Container(
                // margin: const EdgeInsets.all(10),
                child: _buildTitle('Tôm càng xanh'),
              ),
              Container(
                height: 210,
                // width: MediaQuery.of(context).size.width, 
                child: _buildListView(),
              ),
              //--------end tom cang xanh------------
              //-------tom cang xanh ---------------
              Container(
                // margin: const EdgeInsets.all(10),
                child: BuildListTitle.title(title: 'Tôm càng xanh'),
              ),
              Container(
                height: 210,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
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
                            'title',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          child: Text('180.000đ',
                              style: TextStyle(fontSize: 20.0)),
                          flex: 2,
                        ),
                        Expanded(
                          child: Icon(Icons.navigate_next),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 50,
                            width: 50,
                            child: Image.asset('lib/assets/icon80.png'),
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Text(
                            'title',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          child: Text('180.000đ',
                              style: TextStyle(fontSize: 20.0)),
                          flex: 2,
                        ),
                        Expanded(
                          child: Icon(Icons.navigate_next),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 50,
                            width: 50,
                            child: Image.asset('lib/assets/icon50.png'),
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Text(
                            'title',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          flex: 2,
                        ),
                        Expanded(
                          child: Text('180.000đ',
                              style: TextStyle(fontSize: 20.0)),
                          flex: 2,
                        ),
                        Expanded(
                          child: Icon(Icons.navigate_next),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //--------end tom cang xanh------------
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

class TypeShrimp {
  String type;
  TypeShrimp(this.type);
}

List<TypeShrimp> _data = [
  TypeShrimp('50 con/kg'),
  TypeShrimp('30 con/kg'),
  TypeShrimp('20 con/kg'),
];

ListView _buildListView() {
  return ListView.builder(
    scrollDirection: Axis.vertical,
    padding: const EdgeInsets.all(6.0),
    itemCount: _data.length,
    itemBuilder: (BuildContext context, int index) {
      TypeShrimp _typeShrimp = _data[index];
      return GestureDetector(
        onTap: (){
          print('click');
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPrice()));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //_buildRow(_typeShrimp.type, Icons.navigate_next),
            BuildRowPrice.title(title: _typeShrimp.type),
            Divider(
              color: Colors.black45,
            ),
          ],
        ),
      );
    },
  );
}

