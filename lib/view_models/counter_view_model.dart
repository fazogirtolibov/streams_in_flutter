import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stream_flutter/data/stream_generator.dart';

class CounterViewModel extends ChangeNotifier {
  CounterViewModel() {
    listenName();
  }

  int numberFirst = 0;

  degreeNumber(int number) {
    numberFirst = number * number;
    notifyListeners();
  }

  int numberLength = 0;

  lengthNumber(String number) {
    numberLength = number.length;
    notifyListeners();
  }

  int counter = 0;
  late StreamSubscription subscription;

  listenNumbers(int number) {
    Stream<int> stream = StreamGenerator.getMyNumbers(number);
    subscription = stream.listen((event) {
      counter = event;
      notifyListeners();
    });
  }

  pauseCounterStream() => subscription.pause();

  resumeCounterStream() => subscription.resume();

  cancelCounterStream() => subscription.cancel();

  //---------------------With Stream Controller ------------

  String name = "Empty";
  StreamController<String> nameStream = StreamController<String>();

  addToStream(String name) {
    nameStream.sink.add(name);
  }

  listenName() {
    Stream<String> stream = nameStream.stream;
    stream.listen((event) {
      name = event;
      notifyListeners();
    });
  }
}
