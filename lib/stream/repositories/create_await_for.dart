import 'dart:async';

class StreamGenerator {
  static Stream<int> getMyNumber() async* {
   for (int i = 1; i < 100; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i;
   }
  }
}