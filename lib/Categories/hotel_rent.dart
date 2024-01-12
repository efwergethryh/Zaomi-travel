import 'package:flutter/material.dart';
import 'package:transportation_application/Templates/Arguments.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transportation_application/Providers/passenger_notifier.dart';
import 'package:provider/provider.dart';

class hotel_rent extends StatefulWidget {
  const hotel_rent({super.key});

  @override
  State<hotel_rent> createState() => _hotel_rentState();
}

class _hotel_rentState extends State<hotel_rent> {
  TextProvider t = TextProvider();
  DateTime? select_check_in;
  DateTime? select_check_out;
  void reset() {
    setState(() {
      select_check_in = null;
    });
  }

  void reseta() {
    setState(() {
      select_check_out = null;
    });
  }

  Future<void> _select_check_in(BuildContext context) async {
    DateTime initialDate = select_check_in ?? DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != select_check_in) {
      setState(() {
        select_check_in = picked;
      });
    } else {
      setState(() {
        select_check_in = null;
      });
    }
  }

  Future<void> _select_check_out(BuildContext context) async {
    DateTime initialDate = select_check_in ?? DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != select_check_in) {
      setState(() {
        select_check_out = picked;
      });
    } else {
      setState(() {
        select_check_out = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                                    title: 'Detination city',
                                    update: Provider.of<TextProvider>(context,
                                            listen: false)
                                        .updateDestination));
                          },
                          child: Container(
                              width: ScreenUtil().setWidth(420),
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Color.fromARGB(240, 223, 227, 236),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 20,
                                    right: 20,
                                    child: Icon(
                                      Icons.trip_origin,
                                      color: const Color.fromARGB(
                                          255, 143, 143, 143),
                                    ),
                                  ),
                                  Positioned(
                                      top: 20.h,
                                      left: 20.w,
                                      child: Consumer<TextProvider>(
                                        builder: (context, value, child) {
                                          return Text(
                                            value.destination_city,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blueGrey,
                                            ),
                                          );  
                                        },
                                      )),
                                ],
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'search',
                                arguments: Arguments(
                                    title: 'Detination city',
                                    update: Provider.of<TextProvider>(context,
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
                                    color: const Color.fromARGB(
                                        255, 143, 143, 143)),
                              ),
                              Positioned(
                                  top: 20,
                                  left: 20,
                                  child: Consumer<TextProvider>(
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

                        //first Date

                        //last date
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
                                  top: select_check_in == null ? 20 : 25,
                                  left: 40,
                                  child: select_check_in == null
                                      ? Text(
                                          'Check-in\n date',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          ),
                                        )
                                      : Text(
                                          '${select_check_in?.toLocal().year}-${select_check_in?.toLocal().month}-${select_check_in?.toLocal().day}',
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
                                    color: const Color.fromARGB(
                                        255, 143, 143, 143),
                                  ),
                                ),
                                Positioned(
                                  top: 20.h,
                                  left: 6.w,
                                  child: GestureDetector(
                                    onTap: () {
                                      select_check_in == null
                                          ? _select_check_in(context)
                                          : reset();
                                    },
                                    child: select_check_in == null
                                        ? Icon(Icons.add, color: Colors.grey)
                                        : Icon(Icons.close, color: Colors.grey),
                                  ),
                                  width: 30,
                                ),
                              ]),
                            ),
                            SizedBox(
                              width: 6,
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
                                  top: select_check_out == null ? 20 : 25,
                                  left: 40,
                                  child: select_check_out == null
                                      ? Text(
                                          'Check-out\n date',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          ),
                                        )
                                      : Text(
                                          '${select_check_out?.toLocal().year}-${select_check_out?.toLocal().month}-${select_check_out?.toLocal().day}',
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
                                    color: const Color.fromARGB(
                                        255, 143, 143, 143),
                                  ),
                                ),
                                Positioned(
                                  top: 20.h,
                                  left: 6.w,
                                  child: GestureDetector(
                                    onTap: () {
                                      select_check_out == null
                                          ? _select_check_out(context)
                                          : reseta();
                                    },
                                    child: select_check_out == null
                                        ? Icon(Icons.add, color: Colors.grey)
                                        : Icon(Icons.close, color: Colors.grey),
                                  ),
                                  width: 30,
                                ),
                              ]),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        // Container(

                        Container(
                            width: 420.w,
                            height: 60.h,
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
                                onPressed: () {},
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
    ;
  }
}
