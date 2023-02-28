import 'dart:async';

import 'package:flutter/cupertino.dart';

class StreamControllerModel extends ChangeNotifier{
  StreamControllerModel() {
    listenName();
  }
 
 String name = 'Empty';
 StreamController<String> streamController = StreamController<String>();

 addToStream(String nameNew) {
  streamController.sink.add(nameNew);
 }

 listenName() {
  Stream<String> stream = streamController.stream;
  stream.listen((event) {
    name = event;
    notifyListeners();
  });
 }

}