import '../models/role.dart';

class User {
  final String _id;
  final String _username;
  final bool _isMale;
  final DateTime _birth;
  final Role _role;
  final String _phone;
  final String _fullName;
  final String _address;

  User(id, username, isMale, birth, role, phone, fullName, address)
      : _id = id,
        _username = username,
        _birth = birth,
        _role = role,
        _phone = phone,
        _fullName = fullName,
        _address = address,
        _isMale = isMale;

  String get address => _address;

  String get fullName => _fullName;

  String get phone => _phone;

  Role get role => _role;

  DateTime get birth => _birth;

  bool get isMale => _isMale;

  String get username => _username;

  String get id => _id;
}
