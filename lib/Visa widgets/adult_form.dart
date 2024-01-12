import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:transportation_application/Visa%20widgets/passport_details.dart';
import 'secondFrom.dart';
import '1stForm.dart';

class adult_form extends StatefulWidget {
  adult_form();

  @override
  State<adult_form> createState() => _adult_formState();
}

class _adult_formState extends State<adult_form> {
  DateTime? selectedDate;
  int activeStep = 0;
  String? dropdownValue;
  late Widget CurrentWidget;
  String? seconddropdownValue;
  int dotCount = 2;
  @override
  void initState() {
    // TODO: implement initState
    CurrentWidget = personalInfo();
  }

  Widget nextButton() {
    return ElevatedButton(
      child: Text('Next'),
      onPressed: () {
        /// ACTIVE STEP MUST BE CHECKED FOR (dotCount - 1) AND NOT FOR dotCount To PREVENT Overflow ERROR.
        if (activeStep == 0) {
          setState(() {
            activeStep++;
          });
          updateWidget();
        }
      },
    );
  }

  /// Returns the previous button.
  Widget previousButton() {
    return ElevatedButton(
      onPressed: () {
        // Decrement dotCount, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
        if (activeStep == 1) {
          setState(() {
            activeStep--;
          });
          updateWidget();
        }
      },
      child: Text('Prev'),
    );
  }

  void updateWidget() {
    switch (activeStep) {
      case 0:
        setState(() {
          CurrentWidget = personalInfo();
        });
        break;
      case 1:
        setState(() {
          CurrentWidget = const secondForm();
        });
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DotStepper(
          activeStep: activeStep,
          dotCount: dotCount,
          shape: Shape.pipe,
          spacing: 10,
        ),
        CurrentWidget,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            previousButton(),
            nextButton(),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        
      ],
    );
  }
}
