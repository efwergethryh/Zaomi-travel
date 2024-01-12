import 'package:flutter/material.dart';
import 'package:transportation_application/Templates/StepperClass.dart';
import 'package:transportation_application/Templates/barTemplate.dart';
import 'package:provider/provider.dart';
import 'package:transportation_application/Providers/visa_provider.dart';
import 'package:transportation_application/Visa%20widgets/adult_form.dart';
import 'package:stepper_list_view/stepper_list_view.dart';
// import 'package:easy_stepper/easy_stepper.dart';

class visa_form extends StatefulWidget {
  visa_form();

  @override
  State<visa_form> createState() => _visa_formState();
}

class _visa_formState extends State<visa_form> {
  int activeStep = 0;
  final titles = List.generate(3, (index) => Text('Adult ${index + 1}'));
  int reachedStep = 0;
  int upperBound = 5;
  int currentStep = 0;
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: new Size(MediaQuery.of(context).size.width, 200.0),
            child: barTemplate(title: "Travellers' details"),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 30,
              ),
              customStepper()
            ]),
          ),
        ),
      ),
    );
  }
}
