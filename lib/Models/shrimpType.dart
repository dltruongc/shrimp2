import 'dart:ffi';

import 'package:mongo_dart/mongo_dart.dart';

class ShrimpType {
  ObjectId _shrimpTypeId;
  String _shrimpTypeName;
  String _shrimTypeDescription;

  ShrimpType(this._shrimpTypeId, this._shrimpTypeName, this._shrimTypeDescription);

  ObjectId get shrimpTypeId => _shrimpTypeId;
  String get shrimpTypeName => _shrimpTypeName;
  String get shrimpTypeDescription => _shrimTypeDescription;

  ShrimpType.fromMap(Map<String, dynamic> map):
    _shrimpTypeId = map['_id'],
    _shrimpTypeName = map['shrimpTypeName'],
    _shrimTypeDescription = map['shrimpTypeDescription'] ?? '';

}