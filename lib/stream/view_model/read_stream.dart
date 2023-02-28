import 'dart:async';

import 'package:default_package/stream/repositories/create_await_for.dart';
import 'package:flutter/cupertino.dart';

class CounterViewModel extends ChangeNotifier {
  CounterViewModel(){
    listensNumbers();
  }

  int counter = 0;
  late StreamSubscription subscription;

  listensNumbers() {
    Stream<int> stream = StreamGenerator.getMyNumber();
    subscription = stream.listen((event) {
      counter = event;
      notifyListeners();
    });
  }

  pauseConterStream() {
    subscription.pause();
  }
  resumeConterStream() {
    subscription.resume();
  }
  cancelConterStream() {
    subscription.cancel();
  }
}


