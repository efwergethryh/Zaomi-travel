import 'package:flutter/material.dart';

class AdderModel extends ChangeNotifier {
  double _value = 0;

  double get value => _value;

  void increment() {
    _value++;
    notifyListeners();
  }
}
