import 'package:flutter/material.dart';
import 'package:transportation_application/Models/passenger_model.dart';
import 'package:transportation_application/Providers/passenger_notifier.dart';
import 'package:transportation_application/my_flutter_app_icons.dart';
import 'package:provider/provider.dart';
import '../Providers/passenger.dart';


class pasTemp extends StatelessWidget {
 
  late passengerModel passenger_model;
  pasTemp({required this.passenger_model});

  late Color minuscolor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    var pas = context.watch<passenger>();
  
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: 400,
            height: 70,
            child: Stack(
              children: [
                Positioned(
                    top: 12,
                    right: 20,
                    child: Column(
                      children: [
                        Text(passenger_model.name,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(passenger_model.requiredAge,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold))
                      ],
                    )),
                Positioned(
                    top: 25,
                    left: 60,
                    child: Consumer<passenger>(
                      builder: (context, value, child) => Text(
                        '${value.getpasC[passenger_model.i].value}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )),
                Positioned(
                  top: 12,
                  left: 80,
                  //  counter > 0
                  //         ? () {
                  //             setState(() {
                  //               counter = counter > 0 ? counter - 1 : 0;
                  //               minuscolor = Colors
                  //                   .blue; // Set the color to blue when the counter is greater than zero
                  //             });
                  //           }
                  //         : () {
                  //             setState(() {
                  //               counter = 0;
                  //               minuscolor = Colors
                  //                   .grey; // Set the color to green when the counter is zero
                  //             });
                  //           },
                  child: Consumer<passenger>(
                    builder: (context, value, child) {
                      return IconButton(
                          onPressed: () {
                            // print(passenger_model.value);

                            pas.decrement(
                                passenger_model.min, passenger_model.i);
                          },
                          icon: Icon(
                            size: 30,
                            MyFlutterApp.minus_circled,
                            color: Colors.blue,
                          ));
                    },
                  ),
                ),
                Positioned(
                  top: 12,
                  child: Consumer<passenger>(
                    builder: (context, value, child) => IconButton(
                        onPressed: () {
                          pas.increment(passenger_model.i);
                          print(passenger_model.value);
                        },
                        icon: Icon(
                          size: 30,
                          Icons.add_circle_outlined,
                          color: Colors.blue,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
