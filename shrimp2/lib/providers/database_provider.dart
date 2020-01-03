import 'package:mongo_dart/mongo_dart.dart';

import '../secret.dart';

class DatabaseProvider {
  Db _db =  Db(SecretKeys.uri);
  
  openDb ()  async{
    await _db.open();
    return  _db;
  }
}