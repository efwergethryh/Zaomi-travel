import 'package:flutter/material.dart';
import 'package:transportation_application/my_flutter_app_icons.dart';

class tab extends StatelessWidget {
  late String title;
  Icon icon;
  tab({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icon(
        //   MyFlutterApp.plane_departure,
        //   size: 15,
        //   color: Colors.black,
        // ),
        icon,
        SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
