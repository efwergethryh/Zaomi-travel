import 'package:flutter/material.dart';
import 'package:transportation_application/Visa%20widgets/adult_form.dart';

class customStepper extends StatefulWidget {
  const customStepper({super.key});

  @override
  State<customStepper> createState() => _customStepperState();
}

class _customStepperState extends State<customStepper> {
  int _index = 0;

  bool isValid = true;

  @override
  Widget build(BuildContext context) {
    final List<Step> _forms = List.generate(
        6,
        (index) =>
            Step(title: Text('Adult ${index + 1}'), content: adult_form()));
    return Material(
        child: Stepper(
      steps: _forms,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      currentStep: _index,
      onStepContinue: () {
        if (_index <= _forms.length) {
          setState(() {
            _index += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      physics: ClampingScrollPhysics(),
    ));
  }
}
