import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shrimp2/Models/shrimpType.dart';
import 'package:shrimp2/bases/base_bloc.dart';
import 'package:shrimp2/events/price_event.dart';
import '../providers/database_provider.dart';
import '../Models/shrimpprice.dart';
import '../bases/base_bloc.dart';
import '../bases/base_event.dart';
import '../events/price_event.dart';
import '../events/shrimptype_event.dart';

class PriceBloc extends BaseBloc with ChangeNotifier {
  
  //---------- price
  List<ShrimpPrice> _listPriceData = [];
  priceType _priceType;

  Map<String, dynamic> get PriceData =>{
    'type': _priceType,
    'data': _listPriceData,
  };


  StreamController _priceCtrl = StreamController();
  Stream get getData => _priceCtrl.stream;



  Future<List> getAllPrice(int quantity, String typeshrimp)  async {
    Db db = await DatabaseProvider().openDb();
    var coll = db.collection('shrimpprices');
    var result = await coll.find({'shrimpsizes.shrimpSizeQuantity': quantity, 'shrimptypes.shrimpTypeName': typeshrimp }).toList(); //{'shrimptypes.shrimpTypeName': shrimpType, 'shrimpsizes.shrimpSizeQuantity': shrimpSize}
    result.forEach((x) => _listPriceData.add(ShrimpPrice.fromMap(x)));
    
    // result = result.map((x) => ShrimpPrice.fromMap(x)).cast<Map<String, dynamic>>();
    // _listPriceData = result.cast<ShrimpPrice>();
    notifyListeners();
    return result;
    // if(result == null){
    //   _priceCtrl.sink.addError('Khoong co du lieu');
    //   return null;
    // }
    // else _priceCtrl.sink.add(result.toList());
    // print(result);
    db.close();

  }

  @override
  void dispatch(BaseEvent event) async {
    // TODO: implement dispatch
    if(event is PriceEvent) if (event.pricetype == priceType.getAllData){
      _listPriceData.isNotEmpty ?? _listPriceData.removeRange(0, _listPriceData.length);
      _listPriceData.removeRange(0, _listPriceData.length);
      getAllPrice(event.quantity, event.typeshrimp);
      print(event.quantity);
      print(event.typeshrimp);
      print('calllllll');
     // print(event.quantity);
    }
    else {
      print('no calll');
    }
  }

  @override  
  void dispose(){
    _priceCtrl.close();
    super.dispose();
  }
  
}