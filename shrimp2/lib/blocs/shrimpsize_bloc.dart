import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shrimp2/Models/shrimpsize.dart';
import 'package:shrimp2/bases/base_bloc.dart';
import '../providers/database_provider.dart';
import '../bases/base_bloc.dart';
import '../bases/base_event.dart';
import '../events/shrimpsize_event.dart';

class ShrimSizeBloc extends BaseBloc with ChangeNotifier {
  
  //------------shrimptype
  List<ShrimpSize> _listShrimpSize = [];
  ShrimpSizeEnum _ShrimpSizeEnum;
  
  Map<String, dynamic> get ShrimpSizeData =>{
    'type': _ShrimpSizeEnum,
    'data': _listShrimpSize,
  };

  StreamController _shrimpSizeCtrl = StreamController();
  Stream get getData => _shrimpSizeCtrl.stream;

    Future<List> getAllShrimpSize()  async {
    Db db = await DatabaseProvider().openDb();
    var coll = db.collection('shrimpsizes');
    var result = await coll.find().toList();
    result.forEach((x) => _listShrimpSize.add(ShrimpSize.fromMap(x)));
    notifyListeners();
    return result;
    db.close();

  }

  @override
  void dispatch(BaseEvent event) async {
    // TODO: implement dispatch
    if(event is ShrimSizeEvent) if(event.shrimpSizeEnum == ShrimpSizeEnum.getAllData){
      _listShrimpSize.isNotEmpty ?? _listShrimpSize.removeRange(0, _listShrimpSize.length);
      getAllShrimpSize();
    } else{}
  }

  @override  
  void dispose(){
    _shrimpSizeCtrl.close();
    super.dispose();
  }
  
}