import 'package:flutter/material.dart';
import 'package:transportation_application/Templates/dropdownList.dart';

class passport_datails extends StatelessWidget {
  passport_datails({super.key});
  List<String> titles = [
    'Passport Number',
    'Issue place',
    'City',
    'Address',
  ];
  List<List<List<String>>> lists = [
    [
      [
        'Nationality',
      ],
      ['Passport Type', 'Normal']
    ],
  ];
  @override
  Widget build(BuildContext context) {
    List<TextEditingController> controllers =
        List.generate(7, (index) => TextEditingController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Passport Details',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: List.generate(
              4,
              (index) => Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'TextField is required';
                        }
                      },
                      controller: controllers[index],
                      decoration: InputDecoration(labelText: titles[index]),
                    ),
                  )),
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: List.generate(
            1,
            (index) => Row(
              children: [
                Row(
                    children: List.generate(
                        2,
                        (row) => dropdownList(
                            title: lists[index][row][0],
                            list: lists[index][row]))),
              ],
            ),
          ),
        )
      ],
    );
  }
}
