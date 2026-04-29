import 'package:flutter/material.dart';

class RiverpodModel extends ChangeNotifier {
  int counter = 0;
  RiverpodModel({required this.counter});

  void addCounter() {
    counter++;
    notifyListeners();
  }

  void removeCounter() {
    counter--;
    notifyListeners();
  }

  void resetCounter() {
    counter = 0;
    notifyListeners();
  }
}
