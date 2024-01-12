import 'package:flutter/material.dart';
import 'package:transportation_application/Providers/insurance_passenger_provider.dart';
import 'package:transportation_application/Templates/Arguments.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transportation_application/Providers/passenger_notifier.dart';
import 'package:transportation_application/Templates/snackBar.dart';

class insurance extends StatefulWidget {
  const insurance({super.key});

  @override
  State<insurance> createState() => _insuranceState();
}

class _insuranceState extends State<insurance> {
  DateTime? departure_date;
  DateTime? return_date;
  void reset() {
    setState(() {
      departure_date = null;
    });
  }

  void reseta() {
    setState(() {
      return_date = null;
    });
  }

  Future<void> _departure_date(BuildContext context) async {
    DateTime initialDate = departure_date ?? DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != departure_date) {
      setState(() {
        departure_date = picked;
      });
    } else {
      setState(() {
        departure_date = null;
      });
    }
  }

  Future<void> _return_date(BuildContext context) async {
    DateTime initialDate = departure_date ?? DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != departure_date) {
      setState(() {
        return_date = picked;
      });
    } else {
      setState(() {
        return_date = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    snackBar snackbar = snackBar();

    return SafeArea(
      child: Container(
        width: 600,
        height: 500,
        child: SafeArea(
            child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'search',
                      arguments: Arguments(
                          title: 'Departure',
                          update: Provider.of<insurance_provider>(context,
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
                    Positioned(
                        top: 20.h,
                        left: 40.w,
                        child: Consumer<insurance_provider>(
                          builder: (context, value, child) => Text(
                            value.insearchInput,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          ),
                        )),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: Icon(
                        Icons.trip_origin,
                        color: const Color.fromARGB(255, 143, 143, 143),
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'search',
                      arguments: Arguments(
                          title: 'Departure',
                          update: Provider.of<insurance_provider>(context,
                                  listen: false)
                              .updatedestination));
                },
                child: Container(
                  width: 420.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromARGB(240, 223, 227, 236),
                  ),
                  child: Stack(children: [
                    Positioned(
                        top: 20.h,
                        left: 40.w,
                        child: Consumer<insurance_provider>(
                          builder: (context, value, child) => Text(
                            value.destination_city,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          ),
                        )),
                    Positioned(
                      top: 20,
                      right: 20,
                      child: Icon(
                        Icons.trip_origin,
                        color: const Color.fromARGB(255, 143, 143, 143),
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15.w,
                  ),
                  //check_in
                  Container(
                    width: ScreenUtil().setWidth(420 / 2),
                    height: 60.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromARGB(240, 223, 227, 236),
                    ),
                    child: Stack(children: [
                      SizedBox(
                        width: 150,
                      ),
                      Positioned(
                        top: departure_date == null ? 20 : 25,
                        left: 40,
                        child: departure_date == null
                            ? Text(
                                'Departure\ndate',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              )
                            : Text(
                                '${departure_date?.toLocal().year}-${departure_date?.toLocal().month}-${departure_date?.toLocal().day}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey,
                                ),
                              ),
                      ),
                      Positioned(
                        top: 20.h,
                        right: 20.w,
                        child: Icon(
                          Icons.calendar_today,
                          color: const Color.fromARGB(255, 143, 143, 143),
                        ),
                      ),
                      Positioned(
                        top: 20.h,
                        left: 6.w,
                        child: GestureDetector(
                          onTap: () {
                            departure_date == null
                                ? _departure_date(context)
                                : reset();
                          },
                          child: departure_date == null
                              ? Icon(Icons.add, color: Colors.grey)
                              : Icon(Icons.close, color: Colors.grey),
                        ),
                        width: 30,
                      ),
                    ]),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    width: ScreenUtil().setWidth(410 / 2),
                    height: 60.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color.fromARGB(240, 223, 227, 236),
                    ),
                    child: Stack(children: [
                      SizedBox(
                        width: 150,
                      ),
                      Positioned(
                        top: return_date == null ? 20 : 25,
                        left: 40,
                        child: return_date == null
                            ? Text(
                                'Return date',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              )
                            : Text(
                                '${return_date?.toLocal().year}-${return_date?.toLocal().month}-${return_date?.toLocal().day}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey,
                                ),
                              ),
                      ),
                      Positioned(
                        top: 20.h,
                        right: 20.w,
                        child: Icon(
                          Icons.calendar_today,
                          color: const Color.fromARGB(255, 143, 143, 143),
                        ),
                      ),
                      Positioned(
                        top: 20.h,
                        left: 6.w,
                        child: GestureDetector(
                          onTap: () {
                            return_date == null
                                ? _return_date(context)
                                : reseta();
                          },
                          child: return_date == null
                              ? Icon(Icons.add, color: Colors.grey)
                              : Icon(Icons.close, color: Colors.grey),
                        ),
                        width: 30,
                      ),
                    ]),
                  ),
                ],
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'insurance_passengers');
                },
                child: Container(
                  width: 420.w,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromARGB(240, 223, 227, 236),
                  ),
                  child: Stack(children: [
                    SizedBox(
                      width: 340,
                    ),
                    Positioned(
                      top: 20.h,
                      right: 10.w,
                      child: Icon(
                        Icons.person,
                        color: const Color.fromARGB(255, 143, 143, 143),
                      ),
                    ),
                    //date
                    Positioned(
                        top: 20,
                        left: 20,
                        child: Consumer<insurance_provider>(
                          builder: (context, value, child) {
                            return Text(
                              '${value.getNumbers(0)} ${value.getNumbers(0) > 1 ? 'Adults' : 'Adult'}, ${value.getNumbers(1)} ${value.getNumbers(1) > 1 ? 'Children' : 'Child'}, ${value.getNumbers(2)} ${value.getNumbers(2) > 1 ? 'Infants' : 'Infant'}, ${value.getNumbers(3)} ${value.getNumbers(3) > 1 ? 'Seniors' : 'Senior'}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                              ),
                            );
                          },
                        )),
                  ]),
                ),
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
                        'Search',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (Provider.of<TextProvider>(context, listen: false)
                                .searchInput ==
                            Provider.of<TextProvider>(context, listen: false)
                                .searchInputto) {
                          snackbar.showCustomSnackBar(
                              context, 'Please choose different locations');
                        } else if (departure_date == null ||
                            return_date == null) {
                          snackbar.showCustomSnackBar(context,
                              "Please select Depature and arrival date");
                        }
                      },
                    ),
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
