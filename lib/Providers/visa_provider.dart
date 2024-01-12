import 'package:flutter/material.dart';

class visa_provider extends ChangeNotifier {
  String _searchInput = 'Select Destination';
  String get searchInput => _searchInput;
  int _children = 0;
  int _adults = 0;

  int get children => _children;
  int get adults => _adults;
  String _nationality = 'Select nationality';
  String get nationality => _nationality;

  void updateNationality(String text) {
    _nationality = text;
    notifyListeners();
  }

  void updateSearch(String newText) {
    _searchInput = newText;

    notifyListeners();
  }

  void setchildren(String text) {
    _children = int.parse(text);
  }

  void setAdults(String text) {
    _adults = int.parse(text);
  }
}
