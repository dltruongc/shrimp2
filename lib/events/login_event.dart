import 'package:flutter/foundation.dart';
import '../bases/base_event.dart';

class LoginEvent extends BaseEvent {
  final String _userName;
  final String _password;

  LoginEvent(
    @required String userName,
    @required String password,
  )  : _userName = userName,
        _password = password;

  String get password => _password;

  String get userName => _userName;
}
