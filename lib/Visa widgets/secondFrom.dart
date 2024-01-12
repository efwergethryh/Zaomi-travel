import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transportation_application/Templates/dropdownList.dart';
import 'package:transportation_application/Visa%20widgets/passport_details.dart';

class secondForm extends StatefulWidget {
  const secondForm({super.key});

  @override
  State<secondForm> createState() => _secondFormState();
}

class _secondFormState extends State<secondForm> {
  DateTime? selectedDate;

  String? dropdownValue;

  String? seconddropdownValue;

  @override
  Widget build(BuildContext context) {
    return passport_datails();
  }
}
