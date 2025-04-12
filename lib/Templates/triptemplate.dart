import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:transportation_application/Models/trip.dart';

class tripTemplate extends StatelessWidget {
  late String path;
  late String title;
  late String description;
  late String name;
  late String date;
  late int Price;
  tripTemplate(
      {required this.path,
      required this.description,
      required this.title,
      required this.Price,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,  
            MaterialPageRoute(
                builder: (context) => trip(
                      image: path,
                      description: description,
                      title: title,
                      date: date,
                      Price: Price,
                    )));
      },
      child: Container(
        width: 2500,
        height: 80,
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Container(
              width: 80,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(path),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  overflow: TextOverflow.clip,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [Text(date), Text("${Price}")],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 20,
                    ),
                    Text('8 months')
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
