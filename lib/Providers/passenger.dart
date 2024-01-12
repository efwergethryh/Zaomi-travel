import 'package:flutter/material.dart';
import 'package:transportation_application/Models/passenger_model.dart';
// import 'package:transportation_application/Templates/passengerTemplate.dart';

class passenger extends ChangeNotifier {
  // late int _number;
  Color addColor = Colors.blue, subColor = Colors.grey;
  late int _adult = 1, _child = 0, _infant = 0;
  int getNumbers(int index) {
    int value;
    List<int> numberList = [_adult, _child, _infant];
    value = numberList[index];
    return value;
  }

  List<passengerModel> _pasC = [
    passengerModel(
        min: 1, name: 'Adult(s)', requiredAge: '+25 Years', value: 1, i: 0),
    passengerModel(
        min: 0, name: 'Child(ren)', requiredAge: '+6 Years', value: 0, i: 1),
    passengerModel(
        min: 0, name: 'infant(s)', requiredAge: '+2 Years', value: 0, i: 2)
  ];
  List<passengerModel> get pasC => _pasC;

  late final passengerModel Passenger =
      passengerModel(name: '', requiredAge: '', min: 1, value: 1, i: 0);
  // passenger(this._number);
  int get number => Passenger.value;
  void increment(int i) {
    if (_pasC[i].value < 9) {
      _pasC[i].value++;
      // subColor = Colors.blue;
    } else {
      _pasC[i].value = 9;
      // addColor = Colors.grey;
    }
    // _number = Passenger.value;
    // print(Passenger.value);
    notifyListeners();
  }

  void decrement(int min, int i) {
    if (_pasC[i].value > min) {
      // subColor = Colors.blue;
      _pasC[i].value--;
    } else {
      _pasC[i].value = min;
      // subColor = Colors.grey;
    }

    notifyListeners();
  }

  List<passengerModel> get getpasC => _pasC;
  void confirm() {
    _adult = _pasC[0].value;
    _child = _pasC[1].value;
    _infant = _pasC[2].value;
    notifyListeners();
  }

  
  int get pasnum => Passenger.value;
  // int getValue(int index) {
  //   return _pasC[index].value;
  // }
}
