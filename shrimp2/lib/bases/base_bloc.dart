import 'dart:async';

import 'package:flutter/material.dart';

import 'base_event.dart';

abstract class BaseBloc {
  StreamController _baseCtrl = StreamController<BaseEvent>();

  BaseBloc() {
    _baseCtrl.stream.listen((event) {
      if(event is! BaseEvent) {
        throw Exception('Invalid Event!');
      }
      else {
        dispatch(event);
      }
    });
  }

  StreamSink<BaseEvent> get event => _baseCtrl.sink;

  void dispatch(BaseEvent event);

  @mustCallSuper
  void dispose() { 
    _baseCtrl.close();
  }
}