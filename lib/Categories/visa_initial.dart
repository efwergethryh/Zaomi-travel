import 'package:flutter/material.dart';
import 'package:transportation_application/Providers/visa_provider.dart';
import 'package:provider/provider.dart';
import 'package:transportation_application/Templates/Arguments.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transportation_application/Templates/snackBar.dart';

class visa_initial extends StatefulWidget {
  const visa_initial({super.key});

  @override
  State<visa_initial> createState() => _visa_initialState();
}

class _visa_initialState extends State<visa_initial> {
  DateTime? selectedDate;
  String? dropdownValue;
  String? seconddropdownValue;

  void reset() {
    setState(() {
      selectedDate = null;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = selectedDate ?? DateTime.now();
    setState(() {
      // firstDateColor = Colors.black;
    });
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    } else {
      setState(() {
        selectedDate = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    snackBar snackbar = snackBar();

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 600,
              height: 500,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'search',
                          arguments: Arguments(
                              title: 'Detination city',
                              update: Provider.of<visa_provider>(context,
                                      listen: false)
                                  .updateSearch));
                    },
                    child: Container(
                      width: 420.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color.fromARGB(240, 223, 227, 236),
                      ),
                      child: Stack(children: [
                        SizedBox(
                          width: 337.w,
                        ),
                        Positioned(
                          right: 20,
                          top: 20,
                          child: Icon(Icons.location_on,
                              color: const Color.fromARGB(255, 143, 143, 143)),
                        ),
                        Positioned(
                            top: 20,
                            left: 20,
                            child: Consumer<visa_provider>(
                              builder: (context, value, child) {
                                return Text(
                                  value.searchInput,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                  ),
                                );
                              },
                            ))
                      ]),
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'search',
                          arguments: Arguments(
                              title: 'Detination city',
                              update: Provider.of<visa_provider>(context,
                                      listen: false)
                                  .updateNationality));
                    },
                    child: Container(
                      width: 420.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color.fromARGB(240, 223, 227, 236),
                      ),
                      child: Stack(children: [
                        SizedBox(
                          width: 337.w,
                        ),
                        Positioned(
                          right: 20,
                          top: 20,
                          child: Icon(Icons.location_on,
                              color: const Color.fromARGB(255, 143, 143, 143)),
                        ),
                        Positioned(
                            top: 20,
                            left: 20,
                            child: Consumer<visa_provider>(
                              builder: (context, value, child) {
                                return Text(
                                  value.nationality,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                  ),
                                );
                              },
                            ))
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: ScreenUtil().setWidth(420),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromARGB(240, 223, 227, 236),
                    ),
                    child: Stack(children: [
                      SizedBox(
                        width: 150,
                      ),
                      Positioned(
                        top: 20.h,
                        left: 6.w,
                        child: GestureDetector(
                          onTap: () {
                            selectedDate == null
                                ? _selectDate(context)
                                : reset();
                          },
                          child: selectedDate == null
                              ? Icon(Icons.add, color: Colors.grey)
                              : Icon(Icons.close, color: Colors.grey),
                        ),
                        width: 30,
                      ),
                      Positioned(
                        top: selectedDate == null ? 20 : 25,
                        left: 40,
                        child: InkWell(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: selectedDate == null
                                ? Text(
                                    'Arrival Date',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.sp,
                                        color: Colors.grey),
                                  )
                                : Text(
                                    '${selectedDate!.toLocal()}'.split(' ')[0],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey,
                                    ),
                                  )),
                      ),
                      Positioned(
                        top: 17.h,
                        right: 10.w,
                        child: Icon(
                          Icons.calendar_today,
                          color: const Color.fromARGB(255, 143, 143, 143),
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15.w,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: ScreenUtil().setWidth(405 / 2),
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 10.0),
                            filled: true,
                            fillColor: Color.fromARGB(240, 223, 227, 236),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          hint: Center(
                              child: const Text(
                            'Adults number',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          )),
                          value: dropdownValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <int>[
                            1,
                            2,
                            3,
                            4,
                            5,
                            6,
                          ].map<DropdownMenuItem<String>>((int value) {
                            return DropdownMenuItem<String>(
                              value: '$value',
                              child: Text(
                                '$value',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: ScreenUtil().setWidth(405 / 2),
                        child: DropdownButtonFormField<String>(
                          isExpanded: true,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 10.0),
                            filled: true,
                            fillColor: Color.fromARGB(240, 223, 227, 236),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          hint: Center(
                              child: const Text(
                            'Child (Below 12 years)',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 12),
                          )),
                          value: seconddropdownValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              seconddropdownValue = newValue!;
                            });
                          },
                          items: <int>[
                            0,
                            1,
                            2,
                            3,
                            4,
                            5,
                            6,
                          ].map<DropdownMenuItem<String>>((int value) {
                            return DropdownMenuItem<String>(
                              value: '$value',
                              child: Text(
                                '$value',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 420.w,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color.fromARGB(240, 223, 227, 236),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: new LinearGradient(colors: [
                          const Color.fromARGB(255, 12, 81, 138),
                          Color.fromARGB(255, 142, 173, 199)
                        ])),
                        child: TextButton(
                          child: Text(
                            'Next',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, 'visa_form');

                            // if (Provider.of<visa_provider>(context,
                            //             listen: false)
                            //         .searchInput ==
                            //     'Select Destination') {
                            //   snackbar.showCustomSnackBar(
                            //       context, 'Destination field is required');
                            // } else if (Provider.of<visa_provider>(context,
                            //             listen: false)
                            //         .nationality ==
                            //     'Select nationality') {
                            //   snackbar.showCustomSnackBar(
                            //       context, "Nationality field is required");
                            // } else if (dropdownValue == null) {
                            //   snackbar.showCustomSnackBar(
                            //       context, "Adults' number can't be empty");
                            // } else {
                            // }
                          },
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
