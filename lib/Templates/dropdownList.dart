import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transportation_application/requests/request.dart';
import 'package:http/http.dart' as http;

class dropdownList extends StatefulWidget {
  List<String> list;
  late String title;
  dropdownList({
    required this.title,
    required this.list,
  });

  @override
  State<dropdownList> createState() => _dropdownListState();
}

class _dropdownListState extends State<dropdownList> {
  late String dropDownVlaue = widget.title;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Row(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            width: ScreenUtil().setWidth(160),
            child: DropdownButtonFormField<String>(
              isExpanded: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                filled: true,
                fillColor: Color.fromARGB(240, 223, 227, 236),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
              hint: Center(
                  child: Text(
                'sadasda',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 12),
              )),
              value: dropDownVlaue,
              onChanged: (String? newValue) {
                setState(() {
                  dropDownVlaue = newValue!;
                });
              },
              items: widget.list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Center(
                    child: Text(
                      value,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.fade,    
                    ),
                  ),
                );
              }).toList(),
            )),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}
