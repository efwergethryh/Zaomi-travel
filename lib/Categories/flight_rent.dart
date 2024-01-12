import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transportation_application/Providers/passenger.dart';
import 'package:transportation_application/Templates/Arguments.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:transportation_application/Providers/passenger_notifier.dart';
// import 'package:transportation_application/Templates/snack.dart';
import 'package:transportation_application/Templates/snackBar.dart';

class flight_rent extends StatefulWidget {
  flight_rent();

  @override
  State<flight_rent> createState() => _flight_rentState();
}

class _flight_rentState extends State<flight_rent> {
  String query = '';
  Color firstDateColor = Colors.grey;
  String placeholder = 'dd-mm-yy';
  DateTime? selectedDate;

  DateTime? lastDate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void onQueryChanged(String newQuery) {
    setState(() {
      query = newQuery;
    });
  }

  void reset() {
    setState(() {
      selectedDate = null;
    });
  }

  void reseta() {
    setState(() {
      lastDate = null;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = selectedDate ?? DateTime.now();
    setState(() {
      firstDateColor = Colors.black;
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

  Future<void> _selectlastDate(BuildContext context) async {
    DateTime initialDate = lastDate ?? DateTime.now();
    final DateTime? lastpicked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (lastpicked != null && lastpicked != selectedDate) {
      // print(lastDate);
      setState(() {
        // print(lastDate);
        lastDate = lastpicked;
        print('picked $lastpicked');
      });
    } else {
      setState(() {
        lastDate = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    snackBar snackbar = snackBar();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: 600,
                height: 500,
                child: SafeArea(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'search',
                                arguments: Arguments(
                                    title: 'Departure',
                                    update: Provider.of<TextProvider>(context,
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
                                  child: Consumer<TextProvider>(
                                    builder: (context, value, child) => Text(
                                      value.searchInput,
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
                                  color:
                                      const Color.fromARGB(255, 143, 143, 143),
                                ),
                              ),
                              Positioned(
                                  top: 8.h,
                                  left: -3.w,
                                  child: IconButton(
                                    icon: Icon(Icons.swap_vert),
                                    onPressed: () => Provider.of<TextProvider>(
                                            context,
                                            listen: false)
                                        .swap(),
                                  )),
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
                                    title: 'Arrival',
                                    update: Provider.of<TextProvider>(context,
                                            listen: false)
                                        .updateSearchto));
                          },
                          child: Container(
                            width: ScreenUtil().setWidth(420),
                            height: 60,
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
                                    color: const Color.fromARGB(
                                        255, 143, 143, 143)),
                              ),
                              Positioned(
                                  top: 20,
                                  left: 20,
                                  child: Consumer<TextProvider>(
                                    builder: (context, value, child) {
                                      return Text(
                                        value.searchInputto,
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
                        Row(
                          children: [
                            SizedBox(
                              width: 15.w,
                            ),
                            //first Date
                            Container(
                              width: ScreenUtil().setWidth(410 / 2),
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
                                              'Departure',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.sp,
                                                  color: Colors.grey),
                                            )
                                          : Text(
                                              '${selectedDate!.toLocal()}'
                                                  .split(' ')[0],
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueGrey,
                                              ),
                                            )

                                      //  Text(

                                      //   style: TextStyle(
                                      //     fontWeight: FontWeight.bold,
                                      //     color: firstDateColor,
                                      //   ),
                                      // ),
                                      ),
                                ),
                                Positioned(
                                  top: 17.h,
                                  right: 10.w,
                                  child: Icon(
                                    Icons.calendar_today,
                                    color: const Color.fromARGB(
                                        255, 143, 143, 143),
                                  ),
                                ),
                              ]),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            //last date
                            Container(
                              width: ScreenUtil().setWidth(410 / 2),
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
                                      lastDate == null
                                          ? _selectlastDate(context)
                                          : reseta();
                                    },
                                    child: lastDate == null
                                        ? Icon(Icons.add, color: Colors.grey)
                                        : Icon(Icons.close, color: Colors.grey),
                                  ),
                                  width: 30,
                                ),
                                Positioned(
                                    top: 22,
                                    left: 40,
                                    child: lastDate == null
                                        ? Text(
                                            'Arrival',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20.sp,
                                                color: Colors.grey),
                                          )
                                        : Text(
                                            '${lastDate!.toLocal()}'
                                                .split(' ')[0],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blueGrey,
                                            ),
                                          )),
                                Positioned(
                                  top: 17.h,
                                  right: 10.w,
                                  child: Icon(
                                    Icons.calendar_today,
                                    color: const Color.fromARGB(
                                        255, 143, 143, 143),
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'passengers');
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
                                  color:
                                      const Color.fromARGB(255, 143, 143, 143),
                                ),
                              ),
                              //date
                              Positioned(
                                  top: 20,
                                  left: 20,
                                  child: Consumer<passenger>(
                                    builder: (context, value, child) {
                                      // print(textProvider.displayText);
                                      return Text(
                                        '${value.getNumbers(0)} ${value.getNumbers(0) > 1 ? 'Adults' : 'Adult'}  , ${value.getNumbers(1)} ${value.getNumbers(1) > 1 ? 'Children' : 'Child'}, ${value.getNumbers(2)} ${value.getNumbers(2) > 1 ? 'Infants' : 'Infant'}',
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
                                  // if (Provider.of<TextProvider>(context,
                                  //             listen: false)
                                  //         .searchInput ==
                                  //     Provider.of<TextProvider>(context,
                                  //             listen: false)
                                  //         .searchInputto) {
                                  //   snackbar.showCustomSnackBar(context,
                                  //       'Please choose different locations');
                                  // } else if (selectedDate == null ||
                                  //     lastDate == null) {
                                  //   snackbar.showCustomSnackBar(context,
                                  //       "Please select Depature and arrival date");
                                  // }
                                  Navigator.pushNamed(context, 'trips');
                                },
                              ),
                            )),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
