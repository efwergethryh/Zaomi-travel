import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transportation_application/Models/passenger_model.dart';
import 'package:transportation_application/Templates/barTemplate.dart';
import 'package:transportation_application/Templates/passengerTemplate.dart';
import 'package:transportation_application/Providers/passenger_notifier.dart';
import 'package:transportation_application/Providers/passenger.dart';

class passengers extends StatefulWidget {
  const passengers({super.key});

  @override
  State<passengers> createState() => _passengersState();
}

class _passengersState extends State<passengers> {
  TextProvider textProvider = TextProvider();
  @override
  Widget build(BuildContext context) {
    final paseng = Provider.of<passenger>(context, listen: false);
  
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: new Size(MediaQuery.of(context).size.width, 200.0),
          child: barTemplate(title: 'Passengers')),
      body: Column(
        children: [
          Consumer<passenger>(
            builder: (context, value, child) => Column(
              children: value.pasC
                  .map((pasmodel) => pasTemp(
                        passenger_model: pasmodel,
                      ))
                  .toList(),
            ),
            // child:
          ),
          Container(
            width: 100,
            decoration: BoxDecoration(
                gradient: new LinearGradient(colors: [
              const Color.fromARGB(255, 12, 81, 138),
              Color.fromARGB(255, 142, 173, 199)
            ])),
            child: TextButton(
              child: Text(
                'Confirm',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (paseng.pasC[2].value > paseng.pasC[0].value) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      elevation: 0.0,
                      content: Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                            "Infants' number should be less or equal to the adults' number"),
                      )));
                } else if (paseng.getNumbers(2) <= paseng.getNumbers(0)) {
                  paseng.confirm();
                  Navigator.pop(context);
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
