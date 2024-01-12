import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class trip_temp extends StatelessWidget {
  late String Url;
  late String title;
  late String date;
  late String duration;
  trip_temp(
      {required this.title,
      required this.Url,
      required this.date,
      required this.duration});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            width: ScreenUtil().setWidth(58),
            height: ScreenUtil().setHeight(54),
            child: Image.asset(Url),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              //Image
              Text(
                duration,
                style: TextStyle(fontSize: 20.sp),
              ),

              Text(
                Url,
                style: TextStyle(fontSize: 10.sp),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                date,
                style: TextStyle(fontSize: 10.sp),
              )
            ],
          )
        ],
      ),
    );
  }
}
