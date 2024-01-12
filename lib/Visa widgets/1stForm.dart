import 'package:flutter/material.dart';
// import 'package:im_stepper/stepper.dart';
// import 'package:im_stepper/main.dart';
import 'package:transportation_application/Templates/dropdownList.dart';

class personalInfo extends StatefulWidget {
  personalInfo();

  @override
  State<personalInfo> createState() => _personalInfoState();
}

class _personalInfoState extends State<personalInfo> {
  List<List<List<String>>> lists = [
    [
      ['Gender', 'Male', 'Female'],
      [
        'Title',
        'GEN. Certificate of Education',
        'First Secondary',
        'First primary'
      ]
    ],
    [
      ['Martial Status', 'Single', 'Married', 'Divorced', 'Child '],
      [
        'Education',
        'Undefined',
        'University degree',
        'University degree Undefined',
        'Second Secondary',
        'Higher Education',
        'GEN. Certificate of Education',
        'First Secondary',
        'First primary'
      ]
    ],
    [
      [
        'Profession',
        'Undefined',
        'University degree',
        'University degree Undefined',
        'Second Secondary',
        'Higher Education',
        'GEN. Certificate of Education',
        'First Secondary',
        'First primary'
      ],
      [
        'Birth place',
        'Undefined',
        'University degree',
        'University degree Undefined',
        'Second Secondary',
        'Higher Education',
        'GEN. Certificate of Education',
        'First Secondary',
        'First primary'
      ]
    ]
  ];
  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      'First Name',
      'Middle Name',
      'Last Name',
      'Mother Name',
      'Birth Place',
      'Email',
      'Contact',
    ];
    List<TextEditingController> controllers =
        List.generate(7, (index) => TextEditingController());
    return Center(
      child: Container(
        width: 300,
        height: 620,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: widget.key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal information',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Column(
                    children: List.generate(
                        7,
                        (index) => Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'TextField is required';
                                  }
                                },
                                controller: controllers[index],
                                decoration:
                                    InputDecoration(labelText: titles[index]),
                              ),
                            )),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: List.generate(
                        3,
                        (column) => Column(
                              children: [
                                Row(
                                    children: List.generate(
                                  2,
                                  (row) => Row(
                                    children: [
                                      dropdownList(
                                          title: lists[column][row][0],
                                          list: lists[column][row]),
                                    ],
                                  ),
                                )),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
