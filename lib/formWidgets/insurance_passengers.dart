import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transportation_application/Providers/insurance_passenger_provider.dart';
import 'package:transportation_application/Templates/barTemplate.dart';
import 'package:transportation_application/Templates/insurance_passengers_template.dart';
import 'package:transportation_application/Templates/snackBar.dart';

class insurance_info extends StatefulWidget {
  const insurance_info({super.key});

  @override
  State<insurance_info> createState() => _insurance_infoState();
}

class _insurance_infoState extends State<insurance_info> {
  @override
  Widget build(BuildContext context) {
    final pasin = Provider.of<insurance_provider>(context, listen: false);
    snackBar snackbar = snackBar();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: new Size(MediaQuery.of(context).size.width, 200.0),
          child: barTemplate(title: 'Passengers info')),
      body: Column(
        children: [
          Consumer<insurance_provider>(
            builder: (context, value, child) => Column(
              children: value.pasI
                  .map((pasmodel) => insurancePassengers(
                        passenger_model: pasmodel,
                      ))
                  .toList(),
            ),
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
                if (pasin.pasI[2].value > pasin.pasI[0].value) {
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //     behavior: SnackBarBehavior.floating,
                  //     backgroundColor: Colors.transparent,
                  //     elevation: 0.0,
                  //     content: Container(
                  //       padding: EdgeInsets.all(16.0),
                  //       decoration: BoxDecoration(
                  //           color: Colors.red,
                  //           borderRadius: BorderRadius.circular(20)),
                  //       child: Text(
                  //           "Infants' number should be less or equal to the adults' number"),
                  //     )));
                  snackbar.showCustomSnackBar(context,
                      'infants number should be less or equal to th adults number');
                } else if (pasin.getNumbers(2) <= pasin.getNumbers(0)) {
                  pasin.confirm();
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
