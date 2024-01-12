import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transportation_application/Templates/Arguments.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transportation_application/Providers/passenger_notifier.dart';
class car_rent extends StatelessWidget {
   car_rent();
      TextProvider t = TextProvider();

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
                            Navigator.pushNamed(context, 'searchto',
                                arguments: Arguments(title: 'Destination',update: t.updateSearch));
                          },
                          child: Container(
                            width: 370.w,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color.fromARGB(240, 223, 227, 236),
                            ),
                            child: Stack(children: [
                              Positioned(top: 17, child: Icon(Icons.swap_vert)),
                              Positioned(
                                top: 20,
                                left: 40,
                                child: Text(
                                  'from',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 20,
                                right: 20,
                                child: Icon(
                                  Icons.trip_origin,
                                  color:
                                      const Color.fromARGB(255, 143, 143, 143),
                                ),
                              )
                            ]),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 370.w,
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
                                  child: Text(
                                    'to',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey,
                                    ),
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
                              width: 39.w,
                            ),
                            //first Date

                            //last date
                            InkWell(
                              onTap: () {
                                // _selectlastDate(context);
                              },
                              child: Container(
                                width: 370.w,
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
                                    top: 7,
                                    left: 7,
                                    child: IconButton(
                                      onPressed: () {
                                        // setState(() {
                                        //   lastDate = DateTime.now();
                                        // });
                                      },
                                      icon: Icon(Icons.close),
                                    ),
                                    width: 7,
                                  ),
                                  Positioned(
                                    top: 20,
                                    left: 40,
                                    child: Text(
                                      'dd-mm-yy',
                                      // '${lastDate.toLocal()}'.split(' ')[0],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 20,
                                    right: 20,
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: const Color.fromARGB(
                                          255, 143, 143, 143),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Container(

                        Container(
                            width: 370.w,
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
  }
}
