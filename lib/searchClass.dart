import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class searchResult {
  // static final faker = Faker();
  // static final List<String> suggestions =
  //     List.generate(20, (index) => faker.address.city());
  // searchResult();
  static Future<Map> getSuggestions(String query) async {
    final response = await http.get(
        Uri.parse('http://worldtimeapi.org/api/timezone/Europe/Amsterdam'));

    Map data = jsonDecode(response.body);
    print(data);    return data;
  }
}
