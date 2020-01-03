import 'dart:async';
import 'package:flutter/foundation.dart';
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

class ShrimTypeBloc extends BaseBloc with ChangeNotifier {
  
  //------------shrimptype
  List<ShrimpType> _listShrimpType = [];
  ShrimTypeEnum _shrimpType;
  
  Map<String, dynamic> get ShrimpTypeData =>{
    'type': _shrimpType,
    'data': _listShrimpType,
  };

  StreamController _shrimpTypeCtrl = StreamController();
  Stream get getData => _shrimpTypeCtrl.stream;

    Future<List> getAllShrimpType()  async {
    Db db = await DatabaseProvider().openDb();
    var coll = db.collection('shrimptypes');
    var result = await coll.find().toList();
    result.forEach((x) => _listShrimpType.add(ShrimpType.fromMap(x)));
    notifyListeners();
    return result;
    db.close();

  }

  @override
  void dispatch(BaseEvent event) async {
    // TODO: implement dispatch
    if(event is ShrimTypeEvent) if(event.shrimpType == ShrimTypeEnum.getAllData){
      _listShrimpType.isNotEmpty ?? _listShrimpType.removeRange(0, _listShrimpType.length);
      getAllShrimpType();
      print('ahiii');
    } else{}
  }

  @override  
  void dispose(){
    _shrimpTypeCtrl.close();
    super.dispose();
  }
  
}