import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:mongo_dart/mongo_dart.dart';
import '../events/login_event.dart';
import '../providers/database_provider.dart';
import '../validations/account_validation.dart';

import '../bases/base_bloc.dart';
import '../bases/base_event.dart';
import '../models/user_model.dart';

class LoginBloc extends BaseBloc with ChangeNotifier {
  StreamController _loginCtrl = StreamController<User>();

  User _user;

  @override
  void dispatch(BaseEvent event) {
    if (event is LoginEvent) {
      //TODO:
      _user = null;
    }
  }

  Future loginQuest(String email, String password) async {
    // TODO

    Db db = await DatabaseProvider().openDb;
    var coll = db.collection('accounts');
    var result = await coll
        .findOne({'accountUserName': email, 'accountPassword': password});
    if (result == null) {
      _loginCtrl.sink.addError('Đăng nhập thất bại');
      return null;
    } else
      return result;
  }

  Stream get loginCtrl => _loginCtrl.stream;

  User get user => _user;

  bool loginValid(LoginEvent event) {
    if (!AccountValidate.isValidUserName(event.userName)) {
      _loginCtrl.sink.addError('Vui lòng nhập đúng định dạng');
      return false;
    } else if (!AccountValidate.isValidPassword(event.password)) {
      _loginCtrl.sink.add('Mật khẩu phải lớn hơn 6 kí tự!');
      return false;
    } else {
      _loginCtrl.sink.add('OK');
      return true;
    }
  }

  User get loginUser => _user;

  Stream get stream => _loginCtrl.stream;

  @override
  void dispose() {
    _loginCtrl.close();
    super.dispose();
  }
}
