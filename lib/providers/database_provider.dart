import 'package:mongo_dart/mongo_dart.dart';

import '../secret.dart';

class DatabaseProvider {
  Db _db =  Db(SecretKeys.uri);
  Future<Db> get openDb {
    return _db.open();
  }
}