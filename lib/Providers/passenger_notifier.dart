import 'package:flutter/material.dart';

class TextProvider extends ChangeNotifier {
  //texts
  String _searchInput = 'From: Enter city/Airport';
  String _searchInputto = 'To: Enter city/Airport';
  String _displayText = '1 Adult, no discount card';
  String _destination_city = 'Destination city';
  String _nationality = 'Select nationality';
  //functions
  String get nationality => _nationality;
  String get destination_city => _destination_city;
  String get searchInput => _searchInput;
  String get searchInputto => _searchInputto;
  String get displayText => _displayText;

  void updateText(String newText) {
    _displayText = newText;
    notifyListeners();
  }

  void updateSearch(String newText) {
    _searchInput = newText;

    notifyListeners();
  }

  void updateSearchto(String newText) {
    _searchInputto = newText;

    notifyListeners();
  }

  void updateDestination(String text) {
    _destination_city = text;
    notifyListeners();
  }

  void updateNationality(String text) {
    _nationality = text;
    notifyListeners();
  }

  void swap() {
    String spare = _searchInput;
    _searchInput = _searchInputto;
    _searchInputto = spare;
    notifyListeners();
  }
}
