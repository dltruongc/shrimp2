import 'dart:ffi';

import 'package:mongo_dart/mongo_dart.dart';

class ShrimpSize {
  ObjectId _shrimpSizeId ;
  int _shrimpSizeQuantity;
  String _shrimpSizeUnit;
  String _shrimpSizeImage;

  ShrimpSize(this._shrimpSizeId, this._shrimpSizeQuantity, this._shrimpSizeUnit, this._shrimpSizeImage);

  ObjectId get shrimpSizeId => _shrimpSizeId;
  num get shrimpSizeQuantity => _shrimpSizeQuantity;
  String get shrimpSizeUnit => _shrimpSizeUnit;
  String get shrimpSizeImgae => _shrimpSizeImage;

  ShrimpSize.fromMap(Map<String, dynamic> map):
  _shrimpSizeId = map['_id'],
  _shrimpSizeQuantity = map['shrimpSizeQuantity'],
  _shrimpSizeUnit = map['shrimpSizeUnit'] ?? '',
  _shrimpSizeImage = map['shrimSizeImage'] ?? '';

}