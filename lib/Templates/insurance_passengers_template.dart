import 'package:flutter/material.dart';
import 'package:transportation_application/Models/passenger_model.dart';
import 'package:provider/provider.dart';
import 'package:transportation_application/Providers/insurance_passenger_provider.dart';
// import 'package:transportation_application/Models/passenger_model.dart';
import 'package:transportation_application/my_flutter_app_icons.dart';

class insurancePassengers extends StatelessWidget {
  late passengerModel passenger_model;

  insurancePassengers({required this.passenger_model});

  @override
  Widget build(BuildContext context) {
    var inspas = context.watch<insurance_provider>();

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
                    child: Consumer<insurance_provider>(
                      builder: (context, value, child) => Text(
                        '${value.getpasI[passenger_model.i].value}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    )),
                Positioned(
                  top: 12,
                  left: 80,
                  child: Consumer<insurance_provider>(
                    builder: (context, value, child) {
                      return IconButton(
                          onPressed: () {
                            // print(passenger_model.value);

                            inspas.decrement(
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
                  child: Consumer<insurance_provider>(
                    builder: (context, value, child) => IconButton(
                        onPressed: () {
                          inspas.increment(passenger_model.i);
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
