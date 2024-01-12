import 'package:flutter/material.dart';
import 'package:transportation_application/my_flutter_app_icons.dart';

class tripTemplate extends StatelessWidget {
  late String path;
  late String title;
  late String date;

  tripTemplate({required this.path, required this.date, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                image: DecorationImage(
                  image: AssetImage(path),
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
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(date),
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
