import 'package:flutter/material.dart';
import 'package:transportation_application/Models/passenger_model.dart';

class insurance_provider extends ChangeNotifier {
  late int tuneprotectchild = 0, adult = 1, infants = 0, seniors = 0;
  late final passengerModel Passenger =
      passengerModel(name: '', requiredAge: '', min: 1, value: 1, i: 0);
  List<passengerModel> _pasI = [
    passengerModel(min: 1, name: 'Adults', requiredAge: '', value: 0, i: 0),
    passengerModel(min: 0, name: 'Children', requiredAge: '', value: 0, i: 1),
    passengerModel(min: 0, name: 'infants', requiredAge: '', value: 0, i: 2),
    passengerModel(min: 0, name: 'Seniors', requiredAge: '', value: 0, i: 3)
  ];
  List<passengerModel> get pasI => _pasI;
  String _insearchInput = 'Country of residence';
  String get insearchInput => _insearchInput;
  String destination_city = 'Destination city';
  int getNumbers(int index) {
    int value;
    List<int> numberList = [adult, tuneprotectchild, infants, seniors];
    value = numberList[index];
    return value;
  }

  void increment(int i) {
    if (_pasI[i].value < 9) {
      _pasI[i].value++;
      // subColor = Colors.blue;
    } else {
      _pasI[i].value = 9;
      // addColor = Colors.grey;
    }
    // _number = Passenger.value;
    // print(Passenger.value);
    notifyListeners();
  }

  void decrement(int min, int i) {
    if (_pasI[i].value > min) {
      // subColor = Colors.blue;
      _pasI[i].value--;
    } else {
      _pasI[i].value = min;
      // subColor = Colors.grey;
    }

    notifyListeners();
  }

  List<passengerModel> get getpasI => _pasI;
  void confirm() {
    adult = _pasI[0].value;
    tuneprotectchild = _pasI[1].value;
    infants = _pasI[2].value;
    seniors = _pasI[3].value;
    notifyListeners();
  }

  void updateSearch(String newText) {
    _insearchInput = newText;

    notifyListeners();
  }

  void updatedestination(String newText) {
    destination_city = newText;

    notifyListeners();
  }

  int get pasnum => Passenger.value;
}
