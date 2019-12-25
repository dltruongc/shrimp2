
import 'dart:ffi';
import 'package:shrimp2/widgets/prices_features/detailPrice.dart' as prefix0;

import '../Models/shrimpsize.dart';
import '../Models/shrimpType.dart';

class ShrimpPrice {
  // final DateTime _shrimpPriceDate;
  // final num _price;
  // final ShrimpSize _shrimpSize;
  // final ShrimpType _shrimpType;

  // ShrimpPrice(datePrice, price, shrimpsize, shrimptype)
  //   : _shrimpPriceDate = datePrice,
  //     _price = price,
  //     _shrimpSize = shrimpsize,
  //     _shrimpType = shrimptype;

  DateTime _shrimpPriceDate;
  num _price;
  ShrimpSize _shrimpSize;
  ShrimpType _shrimpType;

  ShrimpPrice(this._shrimpPriceDate, this._price, this._shrimpSize, this._shrimpType);

  DateTime get datePrice => _shrimpPriceDate;
  num get price => _price;
  ShrimpSize get shrimpSize => _shrimpSize;
  ShrimpType get shrimpType => _shrimpType;

  ShrimpPrice.fromMap(Map<String, dynamic> map): 
    _shrimpPriceDate = map['shrimpPriceDate'],
    _price = map['price'],
    _shrimpSize = ShrimpSize.fromMap(map['shrimpsizes']),
    _shrimpType = ShrimpType.fromMap(map['shrimptypes']);

}